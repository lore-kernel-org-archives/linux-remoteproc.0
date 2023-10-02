Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D45AE784B0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 17:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238681AbjJBRMQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 13:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238669AbjJBRMP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 13:12:15 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3BDDA;
        Mon,  2 Oct 2023 10:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id7TKl2WCp9TDvu29oDi3yAbkFsFzacPBI7mBrhU4GuLfBZXCaY3uRhmVfO6LwpGkY98FQvYZdSlqwNg/CPhZZXcXLzNWd9s1nQCn1Ntd5nvzHTNj8mLTaUd3T9pf/hnwTW1CKnNH3MUIjEgAeawRzczNh+rY8hl823ljhVWPStwfV5iGqP/wO+MD9cCfhMNDY8HDVO9oA1rT/Q5VHLhkAwm88FNTDFOgOo3TtdEuvP/hRungY45IOcHpzUUZFVSjodeMHpSGez1OucT3bI6UxhJExJeERLkhUV8TpgOaPFTmp3RDH3x0bKh6RZvUTEOL9QOGaASGIjiyz0VSLGmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKTdhSgXS4VXix/bUXnIzehEExFraoFauessTNMF6zY=;
 b=Gx0qiPoAdJAz19NYH8ief+nm5+94cHTod6zkB8Oj4pwOw1z2ltBbxtoFRxGFAq3Z8TZ6b1ImGWSzywYxFAUsCo9BMXC0QZ6Idd0Re1R5ZzgwkjMltDZaZSYfs7Waq4ia62d1KMhJ/xYXOnnKaJ8fDdNV0nrIO4WSPsxROpoIQyO9n2N+Ql3VZPpZyUZhaiXM3qlrb4lbYT5GGb+i2eJGcD/a7QMRHu8dVIyom7FDPEtf+sll/14w1wNMCeBlqyQlkzxmi4MHDxEGhSezHo4wQbHUIiFKdbQNx1BDxG5O7yIMFi8zODbDVxO+s0jHIA8gpo66m2QjH946CwHB1jpmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKTdhSgXS4VXix/bUXnIzehEExFraoFauessTNMF6zY=;
 b=Czk+WVZ7ByFq3KHY9xQ5JvEcCF+su8i3AaodSN+aXzusOHkxZHUMKD2WvQ78cnjEU0auLqOIbggVEG+5dQejd4Yvpm9UvWwFhrJftAavNH54wPcBkRGLZ3HOgultYrLj8imbYLtlc6vDA/NaIMmj71rdkaOA2afbWm1P7R9JyX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3683.namprd12.prod.outlook.com (2603:10b6:a03:1a5::16)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 2 Oct
 2023 17:12:05 +0000
Received: from BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb]) by BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb%7]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 17:12:05 +0000
Message-ID: <eb42f224-5406-47ea-9de3-84593de0e470@amd.com>
Date:   Mon, 2 Oct 2023 12:12:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dts: zynqmp: add properties for TCM in remoteproc
Content-Language: en-US
From:   Tanmay Shah <tanmay.shah@amd.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        radhey.shyam.pandey@amd.com, ben.levinsky@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
 <20230928155900.3987103-3-tanmay.shah@amd.com> <ZRrn5Gj1qvKMBNmx@p14s>
 <dd0e02bc-38ba-441d-8b22-5be7094fcf91@amd.com>
In-Reply-To: <dd0e02bc-38ba-441d-8b22-5be7094fcf91@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To BY5PR12MB3683.namprd12.prod.outlook.com
 (2603:10b6:a03:1a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3683:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7fea8c-3aa6-4521-c441-08dbc36ab3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rzPeQC9iZD4sCYtvIxvq26Puzo52rK8VziOyS1rBs2ZveUfVoedp0VQJw+rRKId3lmE+iYTmAIbDmkPZPHwuv7DPDfTwBrkyyX1zqdi3SDxbGg/c763Z+MyqJtjw44HuB54dkOp6yjB32M895YcW/BYi6AnfYpdGVxMERFICH42QWee6NS9o6nIep7ndmqETIlsyizlNKA3VlznNRV4V7mhKlXdLIIfb0WI6NpJKF/1zSsIWIe9dKY0dqTkzWG8WvAESvFeQDiViqufBMDm1P5MEb6YLAFXThf5QZzoEbCKdMVEbs70xer3efORtMS+r0REdRW7ZRv58H4XVJLFcgySe0q76a0LC2AqU3yqT+4AvPsPiHi5rW4jdRJI/gDd25U9U971dwHZahJTU3wz1IHVhvJisXGgheUBYNEzbhgGnS2dWaekSfe1JdfqimayOf/T9ZxOxpMeRHBrjJVJ893fb1vDh3EJ+/YJ1WOhMENT+UYsHyF9dVAIeZocvplRouCUexvZrJHtMqXrLxUleHw0vVb3wQyeDwo+qhFc+FomIALmoaZtpPvYk/3SRF2qI9DjEfT15bvV7jW/VQw4aF1uTsxxZ1KXQlopmXLs3/htMA30iU7mXekBsd0s9ugITYsQhagX+Vl8DlwGo4TSYQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66946007)(66476007)(66556008)(2906002)(4326008)(8676002)(8936002)(44832011)(5660300002)(316002)(6916009)(41300700001)(6486002)(6512007)(478600001)(6666004)(6506007)(53546011)(31686004)(26005)(2616005)(83380400001)(38100700002)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnRXTlZ6aXdpR0cvRjJTVk9UZFpsUnYxWitrWWpGRlNkWDR5Mm9qdDBtYWFW?=
 =?utf-8?B?NS91a1NpSWs4RDBqRDROSkRDZFJSTk94c0VPTFcyQVNFb2tmTml4aSsxblMw?=
 =?utf-8?B?Z3lxY2ZVQVhmVmJhcUdPcENjZFJEMEFWK2JNUC9PNVZDaFhhVFlQUVFFUmhY?=
 =?utf-8?B?MHhySHlMTyt2THBTeC9YSGF1N0tMSVI2b1VUN28vVm5nVXJ0QnlnelgzL09w?=
 =?utf-8?B?SEFLOHlTTjczTkNnd09FY0tzN0dUK2Q2R0Q1K24xVEdFMHBncWd3aFhqM3Bs?=
 =?utf-8?B?elFaWmlvb3NPc1E5bmtGaDJvNjlJclY3N1A3cmxBMzB1aUthWDJocGJ4UTE0?=
 =?utf-8?B?eGlnWkhGSnZMajFRdEk4NGh0ZzN1MVIydzJiQlk0TFR0eER0ZDBjNjc0TjZU?=
 =?utf-8?B?M0JjMHhnU2cvbk1SMVVLNFdCM29Lb2FNSDhHOXhMMFR1akJMYjBaV1Y4N3l2?=
 =?utf-8?B?QmJFczM2SDBIejdSb3AyeHozVDE1V01zbW5vYVE0NFdMYnhXREE3dXo1Rmty?=
 =?utf-8?B?OU9hTjhjSlpHMERDbVo2a0M3MU5SWEdaWVZtUHJvcHIxS25CcjBucVJYVm9N?=
 =?utf-8?B?QzZFWXZWNlY1MHdETVlPc1BBN2hNTUlkQ1lvT1VPUS9DaThhMHhVMTc4ZU1I?=
 =?utf-8?B?bnZSNjJxR29Ta0RWQ2ZFZm5qK3NqNHdOeGEzUEFvRWFSNVZrN0ttMGlWZUFU?=
 =?utf-8?B?NzlUYWpibWh4VG4vZGE1SEZDSUl5NFNGN2dUMW1qVnBINzNrcWhNVEZodTN4?=
 =?utf-8?B?YUhoelYyZngvSHM1b2U3Wk5lU1h0emZGQ3NYTEZmZ3Y5aFNsU001c2k1RFBR?=
 =?utf-8?B?WUpnZlF4N01Yek9KNUZUZitUK1dBcWV3THJLbHRLRTdsbG1Tcyt2N2lMT2pq?=
 =?utf-8?B?RllYWk81THA5RyswRTB2bnhON2VXaEVDb25RVGRqQ0tDNUNsVXNQYW5OQ2xs?=
 =?utf-8?B?WHF1ZHhLZFdUWlk5M2Q5SWxuUWFLaklCeVE0Vk9PUzNMZmpNRWw0Z1crMCth?=
 =?utf-8?B?VENHZWpxSDZ4b0dmV2NaRXZsSjFxL1FYZjBnd0hodjREMUdjczYvNjFYcFpO?=
 =?utf-8?B?aTUvWXhpTEk1U0I3SjlrQVovR1hLSjBDNDVETGFzNUxJN3R5MUhzSHVZRlJS?=
 =?utf-8?B?anZ5TWpJaUt1ampuZTYySWsrREdTQkxQMzAzdWdIaTE2VlNkblRoNkgzMUtN?=
 =?utf-8?B?VEs5clJkME1yNzdOa3FHc2s0SEcvUDlwNThoSVBtNFVGdytYY0ZTWnFhdWJV?=
 =?utf-8?B?YVNzcnhqREFJQVlBSlJpN0RyRjBXRVlhbG9IdVdjUHRFcEY1b0dKUThXWCtp?=
 =?utf-8?B?M3d4bm43dmRRTzA0Um9ZWTJyVmhKQUFSdlpmcDA3c3hWTEY4RklVU09NYzlN?=
 =?utf-8?B?ejFLRFlsNFRlMlJjZ0taWVJQZS9LMVZ4czM2Nk5ZVld3NVJReDcxU0hWSi8z?=
 =?utf-8?B?dXhqOUdiV2E0V3JZaWR2L2QwWVFxT3BBbHZRVlQ0eHNua04zMVFhQ0hHOEJQ?=
 =?utf-8?B?R0ZacGE5SFhqcnljZlZXVFpFQ2VxdXI2eE1kODFGajg3bStHOFd4QmFKOThT?=
 =?utf-8?B?TmcxMVdzVkdWRVNsc1Vza0hnZlVHc244dk0xb3lZK0V6YjR0QUtwcU4yWGZp?=
 =?utf-8?B?MVJKc3NBbFVSUC9NRWlwU3l1UC9QcUNBdUI3c1dPYzJJc1RLSUNmK0ZEckli?=
 =?utf-8?B?UlJNZGoxOFNZT25yUG5LZVVVSzVtN3NKekJZczNkNmV4cnpmT0xLRDFtZ0x0?=
 =?utf-8?B?eWpwdVBYWTVCN1lGVjZ5U1E3c2xmaVhuSlp6VWtxVmVic01mQlhmc0krdWIz?=
 =?utf-8?B?bUJrN0dDSVQyNFFVSEg4cVpCK25vTXF2NDBOcCtrR3lqN0EvUG45VlI2Q0Zl?=
 =?utf-8?B?aDRPYXA5bExNQW1PUUVLaFdFYS9sT1dCbnowQ082djdCVVZOWjNqNklmT21U?=
 =?utf-8?B?S29zeHB4Zlg0Z2wyZUM5eUt0WEJLQWswNWdOR0ZPUXZmS0xsTXUva1lkeWlE?=
 =?utf-8?B?M1plMWwvZzJHUXQrQ3VwRzlwWDgxTEkrTVNYWWNOOGhOQVR3S3EzVkdka1U0?=
 =?utf-8?B?RWhOMG5hN2tYeUttdmJPejdHalJlRGYrTjlaeXVoMGZvelIzWUtuYXpVb2Y2?=
 =?utf-8?Q?3UV3JkWKC+HbrtU/NMni/luGJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7fea8c-3aa6-4521-c441-08dbc36ab3b7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 17:12:05.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kkLnkuOkSLUOi/WJhOhY9QBcO4LFT4WJJte2Nmi0eyM0BcJoiPnLH/x4GeGrkPN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 10/2/23 11:25 AM, Tanmay Shah wrote:
> Hi Mathieu,
>
> Thanks for the reviews. Please find my comments below.
>
> On 10/2/23 10:55 AM, Mathieu Poirier wrote:
> > On Thu, Sep 28, 2023 at 08:58:58AM -0700, Tanmay Shah wrote:
> > > Add properties as per new bindings in zynqmp remoteproc node
> > > to represent TCM address and size. This patch configures
> > > RPU in split mode and adds TCM information accordingly.
> > >
> >
> > Why is this changed from lockstep to split mode?  What about all the people out
> > there that are expecting a lockstep mode?
>
> I agree, this should have been in split mode in the first place as we would like to demonstrate use of both
>
> RPUs with two separate demo firmwares which is the best use of the
>
> hardware and the most preferred use of zynqmp platform by people. That motivates to change
>
> this to split mode.
>
>
> Now changing this may not be problem for lot of people with following reasons.
>
> The firmwares that are only using first 64KB of TCM memory, they can easily run in split mode as well.
>
> Also rpmsg vring information isn't available in device-tree yet, so I am hoping that firmware that
>
> are using upstream device-tree are not that big yet.
>
> If we change this to split mode before introducing rpmsg related nodes, I bet it will affect very less number of people.
>
>
> For lockstep mode the example is available in dt-bindings document.
>
> So, if people need lockstep mode for any reason, all they need to change is xlnx,cluster-mode property from 0 to 1 and TCM nodes
>
> from bindings document.
>
>
> If you think it's crucial to mention all above, I can send new patch with all above info in commit message.

Something to add to this. So, let's say if we don't change it now, what would be good time to change it?

As I am hopping to use RPU1 as well with upstream device-tree. Please let me know some suggestion to work this.

Thanks and again as always appreciate complete reviews,

Tanmay


>
>
> >
> > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > ---
> > >  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 28 ++++++++++++++++++++------
> > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > index b61fc99cd911..01e12894c88e 100644
> > > --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > @@ -247,19 +247,35 @@ fpga_full: fpga-full {
> > >  		ranges;
> > >  	};
> > >  
> > > -	remoteproc {
> > > +	remoteproc@ffe00000 {
> > >  		compatible = "xlnx,zynqmp-r5fss";
> > > -		xlnx,cluster-mode = <1>;
> > > +		xlnx,cluster-mode = <0>;
> > >  
> > > -		r5f-0 {
> > > +		#address-cells = <2>;
> > > +		#size-cells = <2>;
> > > +
> > > +		ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
> > > +			 <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
> > > +			 <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> > > +			 <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> > > +
> > > +		r5f@0 {
> > >  			compatible = "xlnx,zynqmp-r5f";
> > > -			power-domains = <&zynqmp_firmware PD_RPU_0>;
> > > +			reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
> > > +			reg-names = "atcm", "btcm";
> > > +			power-domains = <&zynqmp_firmware PD_RPU_0>,
> > > +					<&zynqmp_firmware PD_R5_0_ATCM>,
> > > +					<&zynqmp_firmware PD_R5_0_BTCM>;
> > >  			memory-region = <&rproc_0_fw_image>;
> > >  		};
> > >  
> > > -		r5f-1 {
> > > +		r5f@1 {
> > >  			compatible = "xlnx,zynqmp-r5f";
> > > -			power-domains = <&zynqmp_firmware PD_RPU_1>;
> > > +			reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> > > +			reg-names = "atcm", "btcm";
> > > +			power-domains = <&zynqmp_firmware PD_RPU_1>,
> > > +					<&zynqmp_firmware PD_R5_1_ATCM>,
> > > +					<&zynqmp_firmware PD_R5_1_BTCM>;
> > >  			memory-region = <&rproc_1_fw_image>;
> > >  		};
> > >  	};
> > > -- 
> > > 2.25.1
> > > 
