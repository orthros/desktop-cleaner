def get_names
    docs = []
    line_num = 0
    fileName = 'fileNames.txt'
    if !File.exist?(fileName)
        print "The file " + fileName + " doesn't exist"
        exit
    end
    text = File.open(fileName).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|        
        docs.push(line.gsub("\n",''))
    end
    docs
end

def get_target_dir
    targetDir = File.join(Dir.home, "Desktop")
    if !Dir.exists?(targetDir)
        print "The Directory " + targetDir + " doesn't exist\n"
        exit
    end
    targetDir
end

dir = get_target_dir
fileNames = get_names

loop do
    sleep 5
    #print "Checking " + dir + " for errant files\n"
    fileNames.each do |file|
        filePath = File.join(dir, file)
        if File.exists?(filePath)
            File.delete(filePath)
        end
    end
end