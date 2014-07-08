batchdir = require('batchdir')
prompt = require('prompt')

targetDirectory = folderName = howManyFolders  = 'unknown'
foldersToMake = []

validateFolderSyntax = (folder) ->
  if folder.lastIndexOf('/') !=  folder.length-1
  then folder += '/'
  return folder

makefolders = () ->
  for i in [0...howManyFolders]
    folder = targetDirectory + folderName + i
    console.log('Making directory ' + folder)
    foldersToMake.push(folder)

  batchdir(foldersToMake).mkdirs((err)->
      if err then console.log(err)
      else console.log('Finished!')
  )

prompt.start()
prompt.get(['targetDirectory', 'folderName', 'howManyFolders'], (err, result) ->
  if err then console.log(err)
  targetDirectory = validateFolderSyntax(result.targetDirectory)
  folderName = result.folderName
  howManyFolders = result.howManyFolders
  makefolders()
)
