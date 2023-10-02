Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C525E748F6
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 16:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237864AbjJBQ0H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 12:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjJBQ0G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 12:26:06 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C529E83;
        Mon,  2 Oct 2023 09:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3P/fQ9rgw7L+r6blkhbNO4pZM7nabpOzqGj8AKhi1SvfP9Kp2S0vFfgQNi9XKjP4P6CV63vGwh90jgBFKDeOmwsPx6XZKSPzOoFrjt/TUJX2xXkrfo84wGk1thszqHhzERQO+sxHdMD091RmQjR//sMlrMdQeBuMRBEwFcJpc2uX8p1aXV9gOax+p+U2vo/9o4W1iWwSLCSLUgVgFidUkjcsfuuqPZtlB1ha9ac3PEnKzpeALc4vmOmNOvhg+7jwt9QC52Ry97ns4cOBQjcu6flSAWj1l5g0shMu485+RZSD+8vRHC2hHyyaX6EMq8NH2PHWHzmLb4U9QhhsV6MHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxgmF0B+VSooZAAZlqPXVDVnRWaAanak+OzBNNEiZeI=;
 b=OjwLDoMqHTajEO1rqnaIt2048c+F0bR3x4y0PdP6xhGGzCVg4VirBbUKopLh1nKYvGtn7foMQdnKB6Fcl2jQBSfh0W8f+aMJAsZn+5GYcXcM4vO9/KMYmTqTuhtzvlm9sEQOy3UUEksbCgfy/U/7bqrsJmRulM9hdppD6yZsHTCIpwkHJhX53Bs4TS8H4FE6ATJDZr1Lv6KHmTGmw7lJVFFf1rd8Hbaacj5TH4GjIr6YJQJNJiNvu0wp/tZkJEtTMB7oRFyYP6Wn/a51KrK5zknS88fvbW9RADn8YWYhaTIE2YLjCfuydTNtyCr/qTfKUY/ZWtR+kSPTaxT5duv2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxgmF0B+VSooZAAZlqPXVDVnRWaAanak+OzBNNEiZeI=;
 b=Gfi/C+2N9ChpSLu5pe1FF7bpUj2xKfeCSn4ZsPXATDYrPb0DTgrN3riSwkhJl0IdykQ+v25ESBB3ModygO/YgF3i/g/elA9bm+Hju+5Ttg3S3Ruz2nrgxOPnnqtsfPejTw1+WBiMedrkNV1ZAhhGlprqaQxyAtx9jbKq+EBRIM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3683.namprd12.prod.outlook.com (2603:10b6:a03:1a5::16)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 16:25:59 +0000
Received: from BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb]) by BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb%7]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 16:25:59 +0000
Message-ID: <dd0e02bc-38ba-441d-8b22-5be7094fcf91@amd.com>
Date:   Mon, 2 Oct 2023 11:25:52 -0500
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
From:   Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <ZRrn5Gj1qvKMBNmx@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To BY5PR12MB3683.namprd12.prod.outlook.com
 (2603:10b6:a03:1a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3683:EE_|MN2PR12MB4288:EE_
X-MS-Office365-Filtering-Correlation-Id: d53b4e26-a869-44f7-35ac-08dbc364431a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTNi9K+9thYI8rb+8vaYil/r7jnCRcCCBdE8TZTGFHysSUbxkir4wj7n6834T2GMC+LsoIf36r4YmjhpsAw+ExDQGFEzrFw73v4xcnyA7Icyz5k+ERojOmHcbOMkfGxLkzdZgeptsQN/Fe2YKK2G06S3ii5CsXKZZm1g8I527luYNpcMRw2lm2Bs0I9kRgAL9XRz9PwTHyrVCMFA3Rzv4W/yiqxOcggXRwBFW42Hb+FZC9uzj/3CkbJy8T08kAnDG6R2k0sl4skXhyjPM8Ck8uyUeLNZmjOAaCFxa4NbA8gLVW4IU7gQCr9iq2wpuwyfPNo9QDSgEHLv790DDU78Dr4B4JjJcyuIX787WW/d3mJErHG13Tq4CSSelPvcGd3o3KgIxHCYPO6X2JWmPhySC29PRYbsrUXFmiyC9SD1e4UfL0ZHr5YVAj8PtvtS4OPja52TiwTPznzLlLXs9ODJN9nnv4cU/3JghtmZgGp9rs/lLBDf33HNWmzWtHmKSgOOgZNaB3abE3XSaHkai9MvK7ETkJgM3CWcOhMFCwFdsXGWuQIu9ioUXnO428p0aki8SjT0d0WNb8uV6wmhvnJaBquVyyS2kPJ90WCCrYVyiMAzY+VeOU/2iTLpjEPvOROUWLLBKaiQHav+bDC7zR58Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6666004)(31696002)(41300700001)(38100700002)(86362001)(44832011)(478600001)(53546011)(66476007)(66946007)(66556008)(6506007)(6916009)(6512007)(6486002)(5660300002)(31686004)(8676002)(4326008)(8936002)(316002)(2906002)(36756003)(2616005)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTQ2RUNHYlAyNEtiM0kxQkRyZTBBU2VSUnE4VUh6Mm9yd2hnekJZMmtFWGxQ?=
 =?utf-8?B?ZTFsUERNUzNCYUJrM2VHUU1UblRKem1JYWJLT25rUmtzM1p6ellqVVI4eEpu?=
 =?utf-8?B?blVGakV1OTNXRkpPalVtaTZ4N0pwd3Q5aXBWRHlBT1RhYzkrZGhvSFV2UnlL?=
 =?utf-8?B?Q2hiSzZWdUUxQ3Q1TTJEWWJUKzVFRFR6T3lHR205VFV3VWh3Y1ErbW4xZnk1?=
 =?utf-8?B?VXpVbGhZZXVaZ1Zva29GeTdKTXgrV21nSUtjRHY1Z1N4VENZcGNjbDhaQmI4?=
 =?utf-8?B?b3pkczdHc1phczFJRkVLeTdrZXZGR0kzSDlVQUJablA5QUI4RitsT2dvaE5H?=
 =?utf-8?B?cHZkWEc1Q2JicG9rNFFOcG5WYzRURTZuNU9hb3NMVWZNSENNYUdMR3luQ0hC?=
 =?utf-8?B?QmR6U3VqOGNkd2twMmtPb3h6bnNaOUJURGFlcnRwck5iQWhiR1VoMkF1WlIz?=
 =?utf-8?B?QVFrTm9yZHpuODg2THBLY3FmUTlZL0lDTmxyS0tkd3IvanJNQm5GTTh1YUdu?=
 =?utf-8?B?b3dUVWY5aWlaRHh1MFJVZGhGbXNtVFNrWkh6SkROUDQ0aDNzWEZVTTNCaEdR?=
 =?utf-8?B?T3B1U29HVEpQaGtBTHRkNjFEWDVGMStET0x0N1YxeTRKME9vY1g0TXV2S1hK?=
 =?utf-8?B?N1dQUTVBdHROeE9UNnpVRFlhUkJhMlN6eTFqcUE4ZGdUUHAwVlBNNU9zazVE?=
 =?utf-8?B?alBWaEdKZUJVZzBhY1U1Y21BQlRKb1lSU1BiZzRmaFltZkpvUWt2N3VOZ3hn?=
 =?utf-8?B?aERqWXNOak1rRENVTk9tdHNtNlRXNTFLUTZyQWdMSGI1NGhtRVNLM0VPVVgr?=
 =?utf-8?B?dzM3RTZjaUtTNkRNUDFzNFhaZnZIVEtOOUp0aVhLNGRyZnpwUVMwWjZPQk8y?=
 =?utf-8?B?ZW5FaTF3dWxPNUNieHB1K2NNSGxVL3E0RE0wRmJrR0pjYzJwNGVvREk5dTJL?=
 =?utf-8?B?a0VjN3BrVVBkNnBVQWt6NzVZVjEyRWRPVDMwbGRwejdTS01CSExDRzRjQVBv?=
 =?utf-8?B?VFJzcHljMW41aE1BcHRQb3NkNzM4WnJHWHNQNnMyY3k1QmpBQnJQZjkySzZN?=
 =?utf-8?B?eHB5UlBWVHFYbWQ1dzBNTmZCUnArTVJBTDgvRlA2N20veUtwUGhkaUtXbTRx?=
 =?utf-8?B?WnFlbGZncGZZVlhqaXFKbmdKSWlKL3Y4ZVg2aGE2WVQwSHFRZk9sS1JzU3p4?=
 =?utf-8?B?VVlaYVdnODY3dzB3TkwrcGZpN1dOUml3anYzSytGb3daZG5mWUZtQVJBeDA1?=
 =?utf-8?B?ZkNTMXJrQ0NiWVJxcnJjV0ROMnFwZUNFOTBjWDRGekFmb0x1M0FXTjdmN3Bu?=
 =?utf-8?B?bHBlR2hhRm5aVy9BZkNZTXRSVGRjTzZteHVqR05oQU5uQ01jKzlDcUdXQXU4?=
 =?utf-8?B?THRTZTZuV2ovMUMyYzBqYmZXS0grSkZIWnlqd2ZsSmZqUG1ZWEhBZVV6VGw5?=
 =?utf-8?B?OEc1TWhXMldhTDRGNDRYV2xJNXR3M0svemRyanBrYXExNmV4K0x1dFNOS2ow?=
 =?utf-8?B?OFlZeStQRFlKaHhiOWlHT0tPanFrNFgzd1pjNkV2dVhFVHJqZWNKYi92Sk1T?=
 =?utf-8?B?K0hoRTY2VElRS3pSUmFDR0k2aWhha0RoeHpSdi81emFkY1FKcHA4cC92TkJS?=
 =?utf-8?B?Q1RselZrZTJuc2RGZkd2aEFxQUhzdkNOT3hHakQ2Vk5yby90RVpYVjFwa1Z1?=
 =?utf-8?B?RVpXaDkya0FzaTJ4UnJGY1BtY2pHTFVYOTY5ZWsvQmZUUzZJQzNhQkp1aE5R?=
 =?utf-8?B?UjJlb0hFazNWZlM1MzVMeE1xMTFDQTRURlBLV2VQaHB6RStFTXJGa2IrejFK?=
 =?utf-8?B?Vmcwczcwd3p5ZC9Rb1k4WmZDenBkRG81VVFoR0xqSXoyZkZrMG5rNGlJMDh0?=
 =?utf-8?B?NkFzRVVkeDFSUDlwZFJ1bmRhUnAzaFA2dVN3cDRsY2pBSkwwTmJ3cXdwMC85?=
 =?utf-8?B?d2cwbkczRjlJc1F3RG5MNmRlckkwaWxvQ3o4MjhwblFiWUV4MGU3Z2N6eEZ0?=
 =?utf-8?B?OUxkNDF4TUw2ekVxUmZmaXIwVGhmTmJTMjlLUDl1VkN2UU5nU1F2MTRiOTh3?=
 =?utf-8?B?SzNDM3RGZ0hERDEvWXBUdjBpSHV2VXZKYlZlTlMyYWQ5eWk3c0tFUEFyL3N5?=
 =?utf-8?Q?aqcP+JY35s6T6a5SOfy4qCuzO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53b4e26-a869-44f7-35ac-08dbc364431a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 16:25:59.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/Lalw1vkx4tihGHay2XBWiLxbGOX3/bqQ6DxJirP4oTw+PoeR4g5bw7voe0aqqt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Thanks for the reviews. Please find my comments below.

On 10/2/23 10:55 AM, Mathieu Poirier wrote:
> On Thu, Sep 28, 2023 at 08:58:58AM -0700, Tanmay Shah wrote:
> > Add properties as per new bindings in zynqmp remoteproc node
> > to represent TCM address and size. This patch configures
> > RPU in split mode and adds TCM information accordingly.
> >
>
> Why is this changed from lockstep to split mode?  What about all the people out
> there that are expecting a lockstep mode?

I agree, this should have been in split mode in the first place as we would like to demonstrate use of both

RPUs with two separate demo firmwares which is the best use of the

hardware and the most preferred use of zynqmp platform by people. That motivates to change

this to split mode.


Now changing this may not be problem for lot of people with following reasons.

The firmwares that are only using first 64KB of TCM memory, they can easily run in split mode as well.

Also rpmsg vring information isn't available in device-tree yet, so I am hoping that firmware that

are using upstream device-tree are not that big yet.

If we change this to split mode before introducing rpmsg related nodes, I bet it will affect very less number of people.


For lockstep mode the example is available in dt-bindings document.

So, if people need lockstep mode for any reason, all they need to change is xlnx,cluster-mode property from 0 to 1 and TCM nodes

from bindings document.


If you think it's crucial to mention all above, I can send new patch with all above info in commit message.


>
> > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > ---
> >  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 28 ++++++++++++++++++++------
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > index b61fc99cd911..01e12894c88e 100644
> > --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > @@ -247,19 +247,35 @@ fpga_full: fpga-full {
> >  		ranges;
> >  	};
> >  
> > -	remoteproc {
> > +	remoteproc@ffe00000 {
> >  		compatible = "xlnx,zynqmp-r5fss";
> > -		xlnx,cluster-mode = <1>;
> > +		xlnx,cluster-mode = <0>;
> >  
> > -		r5f-0 {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +
> > +		ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
> > +			 <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
> > +			 <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> > +			 <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> > +
> > +		r5f@0 {
> >  			compatible = "xlnx,zynqmp-r5f";
> > -			power-domains = <&zynqmp_firmware PD_RPU_0>;
> > +			reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
> > +			reg-names = "atcm", "btcm";
> > +			power-domains = <&zynqmp_firmware PD_RPU_0>,
> > +					<&zynqmp_firmware PD_R5_0_ATCM>,
> > +					<&zynqmp_firmware PD_R5_0_BTCM>;
> >  			memory-region = <&rproc_0_fw_image>;
> >  		};
> >  
> > -		r5f-1 {
> > +		r5f@1 {
> >  			compatible = "xlnx,zynqmp-r5f";
> > -			power-domains = <&zynqmp_firmware PD_RPU_1>;
> > +			reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> > +			reg-names = "atcm", "btcm";
> > +			power-domains = <&zynqmp_firmware PD_RPU_1>,
> > +					<&zynqmp_firmware PD_R5_1_ATCM>,
> > +					<&zynqmp_firmware PD_R5_1_BTCM>;
> >  			memory-region = <&rproc_1_fw_image>;
> >  		};
> >  	};
> > -- 
> > 2.25.1
> > 
