const {ccclass, property} = cc._decorator;

@ccclass
export default class NewClass extends cc.Component {
    //声明玩家数组
    @property([cc.Node])
    public playerAnchors:cc.Node[] = [];

    //预制玩家
    @property(cc.Prefab)
    public playerPrefab: cc.Prefab = null

    //预制鱼 
    @property(cc.Prefab)
    public fishPrefab:cc.Prefab = null

    //预制子弹
    @property(cc.Prefab)
    public bulletPrefab: cc.Prefab = null;

    //预制渔网
    @property(cc.Prefab)
    public netPrefab: cc.Prefab = null;

    //预制金币
    @property(cc.Node)
    public coinController: cc.Node = null;

    //子弹回收池
    public bulletPool:cc.NodePool;
    //鱼网回收池
    public netsPool:cc.NodePool;

    protected onLoad(){
        console.log("开始进行打鱼！！");
    }

    public addPlayer(){

    }
}
