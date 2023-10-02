Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F206E776C4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 20:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjJBUym (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 16:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjJBUym (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 16:54:42 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEB2C6;
        Mon,  2 Oct 2023 13:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaqNzEx6qlpVhdjRlLqCSQMTLksgQPjp/WnLU5LKRGxw2lPKnwz62wr+g3y52RJPdxdNGbVzq1vI+i/hw1a+VElObToEUyfbh9RpUghaPxFDSJE+tAbj43CCOkF0QvkfLCi1T+Jej91eSLtfxGZbAwc9GPFat/3thgFSat/RC7wkLI86wP217hRFGJSZIKu4EqUtg3CQOc6nKUbl8FUVFsrQM85zuPmkgCPKfl07HowTbkPrKFSZ0eOARY/Nsh73oWuwcxEQFEYPfrXK4Cis0q3bjfg5a/cLRzB8MbsJvsfPqRF9SNpKHAaDOeuRDMY1Q9D3ojbIn6tKIqtSoCZqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbpB+AoocbRTxiikZzHZl9g37pNzRKZJA+SnuzvcXe8=;
 b=PpBwQLfAixL0SCl5Aq51259fn0FKnOpdoh5RpdiDE2jgIE4q9/t1RxPcSL6xKjRjefzfP6QBP6Rm984Bhb3Wk5B/XiCamEvl4Er85+RW0MoH5RNd9KpP3hHXg+3SOFC+//BgwOE85mCtp8Tb/UiV8YMWWzwmi9fHrE3uNr0LLomrOSj+T3F48YVwTtFfd8hyF69KL2Tds4uH23iwUhotnI91Jx0VQ+czim2b025SB+4h9GGJSwigb96DNuIxwgFh1ob9nJK87j9pv17d0Rtug/XWPrMulXvUwPUzVxsP2HgTieVrLJfpn1BZMF2f5VyBnH49wtmS/HAOdMPF6MJ2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbpB+AoocbRTxiikZzHZl9g37pNzRKZJA+SnuzvcXe8=;
 b=i6K4vFTfiyJC/7pTwfHKiyUtH8FQ7DHZDcjw0adDMNCu1+k/oiLLDiaKXQZxdNBcJTkf0q79F95KDSQnYVACTOIRCqK+ZY+c3o4m53y+EEb/k35iD0AxPTr0ctfWZ6BwrxJoMvlVf9+0UcFJpKYV1ohRiMYuGgNaZe2SJQpApiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3683.namprd12.prod.outlook.com (2603:10b6:a03:1a5::16)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 2 Oct
 2023 20:54:34 +0000
Received: from BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb]) by BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb%7]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 20:54:34 +0000
Message-ID: <ad25d019-b2c9-4de9-ac5f-428c5e44f212@amd.com>
Date:   Mon, 2 Oct 2023 15:54:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dts: zynqmp: add properties for TCM in remoteproc
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        radhey.shyam.pandey@amd.com, ben.levinsky@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
 <20230928155900.3987103-3-tanmay.shah@amd.com> <ZRrn5Gj1qvKMBNmx@p14s>
 <dd0e02bc-38ba-441d-8b22-5be7094fcf91@amd.com>
 <eb42f224-5406-47ea-9de3-84593de0e470@amd.com>
 <CANLsYkwc71m4qm0yoqAWsAZwJbX80pOYMnB2s_fD=t_TsSZnvQ@mail.gmail.com>
From:   Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CANLsYkwc71m4qm0yoqAWsAZwJbX80pOYMnB2s_fD=t_TsSZnvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To BY5PR12MB3683.namprd12.prod.outlook.com
 (2603:10b6:a03:1a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3683:EE_|CH2PR12MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: 1404d8b6-d483-41be-77d8-08dbc389c7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/tS6AeJh7USO5mA9qVhJfJSgzku10itbh0btxvkFzjyb6Gv7i4P/nVWA5ZO/vHpC2JGiXLOQL9qddMMK6y1igQuIR5FEWyFms6SbUjWTltnUZRxEk8d8Ur6/yxTYMhlNLeyvSz7kC1j/LfcRYVb4O6EcQ+2V6Ph5DpDUakFlD3SyO1cCbEod+JivPmjRuYdCBTBppiUkZx0dv/xb5hk2QRFWkoyTyHuUKM8S9JnsaAWcx0GHeY43z8j10/VFptfdZj15oWGK0PHwFuiz2Q+eYNmuJl5TkE4mD/Gsdha3lamDRWdEzoc3L7T0PnmgkSWEczPZBuWixG/3kVywhc7aVvPa19CnDZdX1Tbojln+LmZVF5oeRqhLUxRhYBDXCLwlWNb3hXOQ623cSOmQeZnxrdNFgk+p9gCCt738RNWToudHntJ0yb9jK0mozlh/vujapUMrIYqzv0ocS1SVJFP90Ub9ZphEZjfm/45/AngEJxW6Dqw1zmf5srbe+9g7c6ywrWbpQCPPNi0WLL3dWjgdVIpHmpsv8vkuQx245NvTlmt60Ny9yt4eQqD36N9M1LBDiJy9u48mQbqtHa9OVR6z93ZlaIvnyU03lzakIaSzS889NmY3eOK3+S2lG7KONx09r+Vz9yfMuOlUEs1OIWuFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(41300700001)(66476007)(2906002)(316002)(31696002)(86362001)(8936002)(8676002)(66946007)(5660300002)(6916009)(44832011)(4326008)(66556008)(83380400001)(31686004)(6486002)(2616005)(478600001)(26005)(38100700002)(6666004)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTZSSklNbVV1c1JPOVR5M2t1ZVROUHZUL2xIOFRWUnFoUStTTDQrdnJLU0h6?=
 =?utf-8?B?WXIyaysweE9ZU21kbXJwU2ZlbldDR3RERUhpaW5SZVV6TnVQaVhURGRMLzcx?=
 =?utf-8?B?dWV4UWdoSVg2WVdFZnUyMFdSbDZ5UHRBaXc1Vy8xd0d5ekhRUGNLK0h6OUsz?=
 =?utf-8?B?MzFlV3dybEVBS1FRL3VpQkRKdTFDU1oxdWJjN2xPL2FyOW9lZnFSOW0yMnd1?=
 =?utf-8?B?MmpZaEtpWUxEbU1UYUFldkhVN0krY2ZiMjZjckRqVkNUVmtqSFhCUUd5V0Yy?=
 =?utf-8?B?VnorRmMzbkFHYXJrR2o0Qmpka0pqazgwYkNEdisraWhMNlU2eHRzdU5Vc1o1?=
 =?utf-8?B?RmwxV2k3VTY1YUJhSXNqQkZYTVhWc3NoWENNODZVRjJVS3Z3SFJFL2lNblU0?=
 =?utf-8?B?cUJUUTMzV29Fc1YzQ2tKaDFsdCtkMnRoUlplL3hkbWtkMUhlNktzaTRNT1Bx?=
 =?utf-8?B?ZXZwRXhSaEFJT1FiYXVzRExmTCtmRHFMVEppZTJoQUZTQnR6UW1BWGJpWWNa?=
 =?utf-8?B?L1ZCaTNzR2tSVVJKb0dubVpmMjdNOVBKQjZtQzNXcVhaaWEvN25ac2hNTGMz?=
 =?utf-8?B?eXQ2bjByQ3ZVd1lWYVAvZFVZNU5jY2p3RTA5UVhhYnFFdGxpRHFBY0xmam0v?=
 =?utf-8?B?ZXBsZlk0MHI1L25mZUJicHlUUU1CQzNpeFdxZ0I2NVR6c3A1ZVpLeE9XWUZE?=
 =?utf-8?B?ejNaZ0crWWh5VWdmVWtkVXM2d0Nza21ueTQvNWIzbXRJSW9tUkF4cTIzZkw5?=
 =?utf-8?B?aUtubU5qL1NlMXB0V21lV1ZteDkrMS80bVo5dDhGN2hnSVMrYlFuNm40RStW?=
 =?utf-8?B?aUIxTFpuTTZkOWdDeXlUV0RrUmRnNEVCSmpEMFMvMTNEN2c5M0lzbVVOOWF3?=
 =?utf-8?B?amZEYTJJV1BZekJFeFFBNU9QL3ZmcHAzR3Rodms3eitxMXQvQTE0MzJOZDVm?=
 =?utf-8?B?SElRKzhYMFZWbDZtTW5uZFZZSlhhTzdYdHlDcldGM0dGS0pVNndxMWtYdXQ0?=
 =?utf-8?B?SGg3SnE1dXVXNnd5YlFNbjZDOW1BczcxaG1pSkV4TjNUVDdRTmxKZHgwcW80?=
 =?utf-8?B?YzBlNFN2bUQydVdxdTJ2N0NUZlpyeW9PcndxOFJEWXdmSy8yQnFrWCtYR0pH?=
 =?utf-8?B?ZzllVStSOG5MYjA1YjVmdzg2bm1YLzUxcXNQcWJ6SjRhWHd6MzQ1UDRhNkE4?=
 =?utf-8?B?UGJNYTJzNlFJdGFKc2l6M0pXanhuTDN2aFg1TzlTR3FKN0tvSnVkY2I0eE54?=
 =?utf-8?B?WVhzN01ud0JDT2dsQXpwVGJNTkptdFFOOER2WktLK2ljbjRnVHIvMHJkUDRC?=
 =?utf-8?B?bTNEYlN5dit6ZjNDbFB1ZTA5SXdrd25iUXN0WEthUjI5MjRsK2lEbDZjU0lm?=
 =?utf-8?B?UlZBeWYzSEtMc2sxcW9idURVUjNCR0dZSFZwT2NpUUNxSHJTK1BRTHMyZkgr?=
 =?utf-8?B?OERuWUJtTDdUNHY4UURKV0JnalR3Qk04b0Z5MUpDTmFjeUU5cjhSMStDWUNV?=
 =?utf-8?B?S0tPL0lReVE4Vks1Mi9NNklVcTNXcWh1TTNMY3ZTN2ttS3JvaGxCRXRCa1ov?=
 =?utf-8?B?RlRVS0tzbUVnTjZIL0lUV001Zk0rZE0zVVNXazlKU0JHS054QlNUWHhwVGpl?=
 =?utf-8?B?d085N295Qk5aR01SYzZhL1RrN3BtWXRTd2VxYVRpTFlIRFFPSE5QTDB5eE04?=
 =?utf-8?B?UVNDVVNKTklMbDBPYnNEUHJYOUVTendjaUJ6ZGg2dlNwaUh4S0lSNy9PK2NF?=
 =?utf-8?B?OGdEbGl2MXNMSFRYWEtLOHltNXdBTkNkN25hQzlwd0FLbzFXOTNQZlFxM25H?=
 =?utf-8?B?MHYxU1ptMmR3YXdaRUZPSm1XOU9SaTJZZVFpRzZwNHZKa0I5ZWxqZkI2a0pF?=
 =?utf-8?B?R2s0SWdUYXBEV2JnRS9FODkwdU9NZEdYZkZCRU5JblNvSTIvVmM4MXc2RW1V?=
 =?utf-8?B?NlB5OXFpSnp4ZkZPcUJTbnZFNmhPTThLNnJ0bFRYSFR1YmRQTEdNK0J4ZlBk?=
 =?utf-8?B?WGpBelZQV0NNeUdRQ1ZPSTJnbW5ZWFBCTnlBdnZQMVpVQnJXaGRBM2FpRzVi?=
 =?utf-8?B?SlNHVjREdXQ4QmIvUXYvSFVoSnFjQXkwVkQweXdCVXAvVWtNa2RqbVBWTHI2?=
 =?utf-8?Q?owfEbCz3ZDmfpL3rqVACRdFSN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1404d8b6-d483-41be-77d8-08dbc389c7ec
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 20:54:34.7744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo8qcwTYP/vf4s8JZ4Shk3AEfi+hd5qrC8AIBPO/JhkuzFSzALo+DEX/Z7wfWhlI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 10/2/23 3:17 PM, Mathieu Poirier wrote:
> On Mon, 2 Oct 2023 at 11:12, Tanmay Shah <tanmay.shah@amd.com> wrote:
> >
> >
> > On 10/2/23 11:25 AM, Tanmay Shah wrote:
> > > Hi Mathieu,
> > >
> > > Thanks for the reviews. Please find my comments below.
> > >
> > > On 10/2/23 10:55 AM, Mathieu Poirier wrote:
> > > > On Thu, Sep 28, 2023 at 08:58:58AM -0700, Tanmay Shah wrote:
> > > > > Add properties as per new bindings in zynqmp remoteproc node
> > > > > to represent TCM address and size. This patch configures
> > > > > RPU in split mode and adds TCM information accordingly.
> > > > >
> > > >
> > > > Why is this changed from lockstep to split mode?  What about all the people out
> > > > there that are expecting a lockstep mode?
> > >
> > > I agree, this should have been in split mode in the first place as we would like to demonstrate use of both
> > >
> > > RPUs with two separate demo firmwares which is the best use of the
> > >
> > > hardware and the most preferred use of zynqmp platform by people. That motivates to change
> > >
> > > this to split mode.
> > >
> > >
> > > Now changing this may not be problem for lot of people with following reasons.
> > >
> > > The firmwares that are only using first 64KB of TCM memory, they can easily run in split mode as well.
> > >
> > > Also rpmsg vring information isn't available in device-tree yet, so I am hoping that firmware that
> > >
> > > are using upstream device-tree are not that big yet.
> > >
> > > If we change this to split mode before introducing rpmsg related nodes, I bet it will affect very less number of people.
> > >
> > >
> > > For lockstep mode the example is available in dt-bindings document.
> > >
>
> I could use the same argument for the split mode, i.e default is
> lockstep and there is an example in the dt-bindings document for split
> mode.
>
> > > So, if people need lockstep mode for any reason, all they need to change is xlnx,cluster-mode property from 0 to 1 and TCM nodes
> > >
> > > from bindings document.
> > >
> > >
> > > If you think it's crucial to mention all above, I can send new patch with all above info in commit message.
> >
> > Something to add to this. So, let's say if we don't change it now, what would be good time to change it?
> >
>
> The best way to go about this is to introduce another DT that is
> tailored for split mode.  That way people can choose to boot their
> device in a specific mode using the DT.  If you decide to go this way,
> look at how ST has split their DT for different boards - search for
> "m4_rproc" under " arch/arm/boot/dts/st".

Thanks for the suggestion. I looked at the example and I think it will work.

I have following idea.

So, if I understand this correctly, we introduce two separate nodes in device-tree.

SOC dtsi file: zynqmp.dtsi

remoteproc_lockstep: remoteproc@... {

. . .

status = "disabled";

};


remoteproc_split: remoteproc@... {

 . . .

status = "disabled";

};


And then in board dts enable whatever mode is needed for that board:

*zcu102*.dts

&remoteproc_split {

status = "okay";

};

This sounds like good idea, I hope this is what you mean.

Please let me know if I am missing something.


>
> > As I am hopping to use RPU1 as well with upstream device-tree. Please let me know some suggestion to work this.
> >
> > Thanks and again as always appreciate complete reviews,
> >
> > Tanmay
> >
> >
> > >
> > >
> > > >
> > > > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 28 ++++++++++++++++++++------
> > > > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > > index b61fc99cd911..01e12894c88e 100644
> > > > > --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > > @@ -247,19 +247,35 @@ fpga_full: fpga-full {
> > > > >           ranges;
> > > > >   };
> > > > >
> > > > > - remoteproc {
> > > > > + remoteproc@ffe00000 {
> > > > >           compatible = "xlnx,zynqmp-r5fss";
> > > > > -         xlnx,cluster-mode = <1>;
> > > > > +         xlnx,cluster-mode = <0>;
> > > > >
> > > > > -         r5f-0 {
> > > > > +         #address-cells = <2>;
> > > > > +         #size-cells = <2>;
> > > > > +
> > > > > +         ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
> > > > > +                  <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
> > > > > +                  <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> > > > > +                  <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> > > > > +
> > > > > +         r5f@0 {
> > > > >                   compatible = "xlnx,zynqmp-r5f";
> > > > > -                 power-domains = <&zynqmp_firmware PD_RPU_0>;
> > > > > +                 reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
> > > > > +                 reg-names = "atcm", "btcm";
> > > > > +                 power-domains = <&zynqmp_firmware PD_RPU_0>,
> > > > > +                                 <&zynqmp_firmware PD_R5_0_ATCM>,
> > > > > +                                 <&zynqmp_firmware PD_R5_0_BTCM>;
> > > > >                   memory-region = <&rproc_0_fw_image>;
> > > > >           };
> > > > >
> > > > > -         r5f-1 {
> > > > > +         r5f@1 {
> > > > >                   compatible = "xlnx,zynqmp-r5f";
> > > > > -                 power-domains = <&zynqmp_firmware PD_RPU_1>;
> > > > > +                 reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> > > > > +                 reg-names = "atcm", "btcm";
> > > > > +                 power-domains = <&zynqmp_firmware PD_RPU_1>,
> > > > > +                                 <&zynqmp_firmware PD_R5_1_ATCM>,
> > > > > +                                 <&zynqmp_firmware PD_R5_1_BTCM>;
> > > > >                   memory-region = <&rproc_1_fw_image>;
> > > > >           };
> > > > >   };
> > > > > --
> > > > > 2.25.1
> > > > >
