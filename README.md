# renzu_progressbar
- Unique Design Progress Bar - Support Fontawsome with Animation as Optional
- SAMPLE USAGE
```  
    local o = {
        --scenario = 'WORLD_HUMAN_AA_COFFEE', -- uncomment this if scenario
        dict = "random@shop_gunstore",
        name = "_idle_b",
        flag = 1,
    }
    local prog = exports.renzu_progressbar:CreateProgressBar(10,'<i class="fas fa-tools"></i>',o) -- SYNC
    -- SYNC mode means client will wait for the prog bool before printing the below
    print("done progress")
    
```

# Demo
![image](https://user-images.githubusercontent.com/82306584/132853374-138f6a66-4491-445d-a70e-3bb00e36c0fc.png)


