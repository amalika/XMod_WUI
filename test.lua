local wui = require 'wui'

local globalStyle = {
    scroller = {
        flex = 1,
    },
    category = {
        ['margin-top'] = 20,
        ['padding-left'] = 24,
        ['background-color'] = '#FFF100',
        ['justify-content'] = 'center',
        width = 750,
        height = 68
    },
    ['category-text'] = {
        color = '#000000',
        ['font-weight'] = 600,
        ['font-size'] = 28
    }
}

local rootLayout = {
    view = 'scroller',
    class = 'scroller',
    subviews = {
        {
            view = 'div',
            class = 'category',
            subviews = {
                {
                    view = 'text',
                    class = 'category-text',
                    value = 'Checkbox'
                }
            }
        },
        wui.Checkbox.createLayout({ title = '选项1', value = 1, hasTopBorder = true, hasBottomBorder = false }),
        wui.Checkbox.createLayout({ title = '选项2', value = 2, checked = true, config = { checkedColor = '#f00', uncheckedColor = '#0f0' }}),
        {
            view = 'div',
            class = 'category',
            subviews = {
                {
                    view = 'text',
                    class = 'category-text',
                    value = 'CheckboxList'
                }
            }
        },
        {
            view = 'div',
            style = {
                width = 500,
                ['justify-content'] = 'center'
            }
        },
        {
            view = 'div',
            class = 'category',
            subviews = {
                {
                    view = 'text',
                    class = 'category-text',
                    value = 'radio'
                }
            }
        },
        {
            view = 'div',
            style = {
                width = 400,
                ['justify-content'] = 'center'
            }
        },
        {
            view = 'div',
            class = 'category',
            subviews = {
                {
                    view = 'text',
                    class = 'category-text',
                    value = 'tabbar'
                }
            }
        },
        {
            view = 'div',
            class = 'category',
            subviews = {
                {
                    view = 'text',
                    class = 'category-text',
                    value = 'tabpage'
                }
            }
        },
        {
            view = 'div',
            class = 'category',
            subviews = {
                {
                    view = 'text',
                    class = 'category-text',
                    value = 'tabbar'
                }
            }
        }
    }
}

local context = UI.createContext(rootLayout, globalStyle)
local rootView = context:getRootView()

local function onItemChecked(id, title, value, checked)
    print('wui.Checkbox item id: ' .. id)
    print('wui.Checkbox item title: ' .. tostring(title))
    print('wui.Checkbox item value: ' .. tostring(value))
    print('wui.Checkbox item checked: ' .. tostring(checked))
end

wui.Checkbox.setOnCheckedCallback(rootView:getSubview(2), onItemChecked)
wui.Checkbox.setOnCheckedCallback(rootView:getSubview(3), onItemChecked)

local checkbox = wui.Checkbox.createView(context, { title = '选项3', value = 3, checked = true, disabled = true })
rootView:addSubview(checkbox, 4)
wui.Checkbox.setOnCheckedCallback(checkbox, onItemChecked)

local checkboxList = {
    { title = '选项1', value = 1 },
    { title = '选项2', value = 2, checked = true , disabled = true},
    { title = '选项3', value = { 3 }},
    { title = '选项4', value = '选项4', hasBottomBorder = false}
}

local checkboxList = wui.CheckboxList.createView(context, { list = checkboxList })
rootView:getSubview(6):addSubview(checkboxList)
wui.CheckboxList.setOnCheckedCallback(checkboxList, function (id, checkedList)
    print('wui.CheckboxList id: ' .. id)
    for i, v in ipairs(checkedList) do
        print('> wui.CheckboxList checked item: ' .. v.title)
    end
end)

local radioList = {
    { title = '选项1', value = 1 },
    { title = '选项2', value = 2, checked = true },
    { title = '选项3', value = 3 },
    { title =' 选项4', value = 4 },
    { title = '未选不可修改', value = 5, disabled = true },
    { title = '已选不可修改', value = 6, disabled = true, checked = true }
}
local radio = wui.Radio.createView(context, { list = radioList })
rootView:getSubview(8):addSubview(radio)
wui.Radio.setOnCheckedCallback(radio, function (id, title, value, index, lastIndex)
    print('wui.Radio id: ' .. id)
    print('wui.Radio title: ' .. tostring(title))
    print('wui.Radio value: ' .. tostring(value))
    print('wui.Radio current index ' .. tostring(index))
    print('wui.Radio last index ' .. tostring(lastIndex))
end)

local tabPages = {
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#ff0000'
        },
        subviews = {
            {
                view = 'text',
                value = '首页',
                style = {
                    ['font-size'] = 50,
                    color = '#707070'
                }
            },
            wui.Button.createLayout({ id = 'btn_1', size = 'medium' })
        }
    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#00ff00'
        },
        subviews = {
            {
                view = 'text',
                value = '特别推荐',
                style = {
                    ['font-size'] = 50,
                    color = '#707070'
                }

            }
        }

    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#0000ff'
        },
        subviews = {
            {
                view = 'text',
                value = '消息中心',
                style = {
                    ['font-size'] = 50,
                    color = '#707070'
                }

            }
        }
    },
    {
        view = 'div',
        style = {
            width = 480
        },
        subviews = {
            {
                view = 'text',
                value = '我的主页',
                style = {
                    ['font-size'] = 50,
                    color = '#707070'
                }

            }
        }
    }
}

local tabBarConfig = {}
tabBarConfig.currentPage = 2
tabBarConfig.pageWidth = 480
tabBarConfig.pageHeight = 450
tabBarConfig.tabTitles = {
    {
        title = '首页',
        icon = 'https://gw.alicdn.com/tfs/TB1MWXdSpXXXXcmXXXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1kCk2SXXXXXXFXFXXXXXXXXXX-72-72.png'
    },
    {
        title = '特别推荐',
        icon = 'https://gw.alicdn.com/tfs/TB1ARoKSXXXXXc9XVXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB19Z72SXXXXXamXFXXXXXXXXXX-72-72.png'
    },
    {
        title = '消息中心',
        icon = 'https://gw.alicdn.com/tfs/TB1VKMISXXXXXbyaXXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1aTgZSXXXXXazXFXXXXXXXXXX-72-72.png',
    },
    {
        title = '我的主页',
        icon = 'https://gw.alicdn.com/tfs/TB1Do3tSXXXXXXMaFXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1LiNhSpXXXXaWXXXXXXXXXXXX-72-72.png',
    }
}

tabBarConfig.tabStyle = {
    titleColor = '#660077',
    activeTitleColor = '#66ff77',
    backgroundColor = '#660000',
    activeBackgroundColor = '#008800',
    isActiveTitleBold = true,
    tabWidth = 120,
    tabHeight = 90,
    iconWidth = 50,
    iconHeight = 50,
    fontSize = 20
}

local tabBar = wui.TabBar.createView(context, { pages = tabPages, config = tabBarConfig })
rootView:addSubview(tabBar, 10)
wui.TabBar.setOnSelectedCallback(tabBar, function (id, currentPage)
    print('wui.TabBar id: ' .. id)
    print('wui.TabBar currentPage: ' .. tostring(currentPage))
end)

wui.Button.setOnClickedCallback(context:findView('btn_1'), function (id, action)
    printf('wui.Button %s click', id)
end)

local pages = {
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#0000ff'
        },
        subviews = {
            {
                view = 'text',
                value = '热门跟团',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }
            }
        }
    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#ee00ff'
        },
        subviews = {
            {
                view = 'text',
                value = '云南跟团',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }

            }
        }

    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#1245ff'
        },
        subviews = {
            {
                view = 'text',
                value = '四川跟团',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }

            }
        }
    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#0780ff'
        },
        subviews = {
            {
                view = 'text',
                value = '海南跟团',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }

            }
        }
    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#0000ff'
        },
        subviews = {
            {
                view = 'text',
                value = '北京跟团',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }

            }
        }
    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#0e00ff'
        },
        subviews = {
            {
                view = 'text',
                value = '出境跟团',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }

            }
        }
    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#8900ff'
        },
        subviews = {
            {
                view = 'text',
                value = '出境日游',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }

            }
        }
    },
    {
        view = 'div',
        style = {
            width = 480,
            ['background-color'] = '#dd55ff'
        },
        subviews = {
            {
                view = 'text',
                value = '邮轮',
                style = {
                    ['font-size'] = 100,
                    color = '#707070'
                }
            }
        }
    }
}

local tabPageConfig = {}
tabPageConfig.currentPage = 1
tabPageConfig.pageWidth = 480
tabPageConfig.pageHeight = 560
tabPageConfig.tabTitles = {
    {
        title = '热门跟团',
        icon = 'https://gw.alicdn.com/tfs/TB1MWXdSpXXXXcmXXXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1kCk2SXXXXXXFXFXXXXXXXXXX-72-72.png',
    },
    {
        title = '云南跟团',
        icon = 'https://gw.alicdn.com/tfs/TB1ARoKSXXXXXc9XVXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB19Z72SXXXXXamXFXXXXXXXXXX-72-72.png'
    },
    {
        title = '四川跟团',
        icon = 'https://gw.alicdn.com/tfs/TB1VKMISXXXXXbyaXXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1aTgZSXXXXXazXFXXXXXXXXXX-72-72.png'
    },
    {
        title = '海南跟团',
        icon = 'https://gw.alicdn.com/tfs/TB1Do3tSXXXXXXMaFXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1LiNhSpXXXXaWXXXXXXXXXXXX-72-72.png'
    },
    {
        title = '北京跟团',
        icon = 'https://gw.alicdn.com/tfs/TB1jFsLSXXXXXX_aXXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1_Kc.SXXXXXa8XpXXXXXXXXXX-72-72.png'
    },
    {
        title = '出境跟团',
        icon = 'https://gw.alicdn.com/tfs/TB199sPSXXXXXb4XVXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1DR.3SXXXXXc2XpXXXXXXXXXX-72-72.png'
    }, {
        title = '出境日游',
        icon = 'https://gw.alicdn.com/tfs/TB1hedfSpXXXXchXXXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1mrXaSpXXXXaqXpXXXXXXXXXX-72-72.png'
    },
    {
        title = '邮轮',
        icon = 'https://gw.alicdn.com/tfs/TB1twhkSpXXXXXLXXXXXXXXXXXX-72-72.png',
        activeIcon = 'https://gw.alicdn.com/tfs/TB1dhlhSpXXXXa8XXXXXXXXXXXX-72-72.png'
    }
}

tabPageConfig.tabStyle = {
    backgroundColor = '#FFFFFF',
    titleColor = '#666666',
    activeTitleColor = '#3D3D3D',
    activeBackgroundColor = '#FFFFFF',
    isActiveTitleBold = true,
    iconWidth = 70,
    iconHeight = 70,
    width = 160,
    height = 120,
    fontSize = 24,
    hasActiveBottom = true,
    activeBottomColor = '#FFC900',
    activeBottomHeight = 6,
    activeBottomWidth = 120,
    textPaddingLeft = 10,
    textPaddingRight = 10
}

tabPageConfig.wrapBackgroundColor= '#FF0000'

local tabPage = wui.TabPage.createView(context, { pages = pages, config = tabPageConfig })
rootView:addSubview(tabPage, 12)
wui.TabPage.setOnSelectedCallback(tabPage, function (id, currentPage)
    print('wui.TabPage id: ' .. id)
    print('wui.TabPage currentPage: ' .. tostring(currentPage))
end)

local gridStyle = {
    lineSpacing = 14,
    width = 110,
    height = 50,
    fontSize = 20,
    color = '#333333',
    checkedColor = '#ffffff',
    disabledColor = '#eeeeee',
    borderColor = '#666666',
    checkedBorderColor = '#ffb200',
    backgroundColor = '#ffffff',
    checkedBackgroundColor = '#ffb200',
    icon = ''
}

local testData1 = {
    { title = '上海', disabled = true },
    { title = '杭州', checked = true },
    { title = '北京' },
    { title = '广州' },
    { title = '深圳' },
    { title = '南京' }
}

local testData2 = {
    { title = '上海' },
    { title = '杭州', checked = true },
    { title = '北京', checked = true },
    { title = '广州' },
    { title = '深圳' },
    { title = '南京' }
}

local view = wui.GridSelect.createView(context, { list = testData1, config = { single = true } })
rootView:addSubview(view, 14)
wui.GridSelect.setOnSelectedCallback(view, function (id, index, checked, checkedList)
        print('wui.GridSelect index: ' .. tostring(index))
        print('wui.GridSelect checked: ' .. tostring(checked))
        for i, v in ipairs(checkedList) do
            print('> wui.GridSelect checkedList index: ' .. tostring(v))
        end
    end
)

local view2 = wui.GridSelect.createView(context, { list = testData2, config = { limit = 2, width = 650, gridStyle = gridStyle } })
rootView:addSubview(view2, 15)
wui.GridSelect.setOnSelectedCallback(view2,
    function (id, index, checked, checkedList)
        print('wui.GridSelect index: ' .. tostring(index))
        print('wui.GridSelect checked: ' .. tostring(checked))
        for i, v in ipairs(checkedList) do
            print('> wui.GridSelect checkedList index: ' .. tostring(v))
        end
    end,
    function (id, limit)
        print('wui.GridSelect limit: ' .. tostring(limit))
    end
)

print('show view')
-- 显示UI，但不会阻塞
context:show()
local count = 1
while not context:closed() do
    sleep(100)
end
