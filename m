Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2DAE7AD7E
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Oct 2023 16:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240578AbjJCQco (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Oct 2023 12:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240575AbjJCQcm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Oct 2023 12:32:42 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2BCB0;
        Tue,  3 Oct 2023 09:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xl5E2XIdWqwRWq5vs288VHXpRYSlk4coSIQJtdhgGf0z3uA7SANZ3TQe/CrtNY7Xr7NB12S5UjUXHoBUS7rp5lerUAzpLWk/4BZxh/eVAY+MlGtJ7Tff4p2kdlOcJ5opFqcrtRKsToF17tsNcFy6V1mc55BtIa+/4iAYl/tMNnljoqow0YB3N8GUiJjXCR2BVCuD8flbT+5pBPjpNgBVCOtZMrYBuAnBPesLgjH43lLfdUf+Zv3Piv1A7jWzznla0Tzn9veuOmYUa75HvA3ZOoQNHTt/+HUFnSVVI+F3irkD3UNEHObSHEKqcy1wCDrni+7gMy4J02Vi7Ojq/K0hGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkBk/H40Hl8BpN2mUXF6eMuujT6zO6u+QqIjKCD7WHo=;
 b=nXU80/Ia7Kdyq1g04ubK8jem/FK2QxhaIl61xrwszHprBebIN1CGtjBSMqQFiwUjTp+qTvpBRBey37xEuP0dAU5jr+sEeYN17v9AzmnTcAGbbxx4wWusB2SGscuxADaMjj2ckFAIssYuoKc+qUotbO7E95xneiFdTCPEfT9atqDxhngS9fx1+jXrpFJv0fOiBz1BfLZFkW7NSTlkDrPT9HgEzFOPIQoKs4kcoJoNFElDsEZuQrjX+jRIl1q7DJm7zBCYXSkSBoqHG2S2UWN9I82umde4b7yjsUlzdlAW+CCoyQwc+1Nsuw4JQMMa48teNIPLWuhO/kgu3KXxSD/mSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkBk/H40Hl8BpN2mUXF6eMuujT6zO6u+QqIjKCD7WHo=;
 b=YR7ncYSGmp3VU/KVq1EXBTNj5nNFI4TNPKhg6kc8UcXQy+BufWm0/6Raj+ftZJQZxMLUPJc5kizvxeawRDvZ/jDQqqrhd8AXYRCO2lGm6lljF0+YxWhEWu+OejnQY5UWK8Y6v62rFGqQryzq8+5oIqWPHqgLhU4y9HPQnHugQrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3683.namprd12.prod.outlook.com (2603:10b6:a03:1a5::16)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Tue, 3 Oct
 2023 16:32:36 +0000
Received: from BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb]) by BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb%7]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 16:32:34 +0000
Message-ID: <fdab2b65-a2a7-4d1d-858c-4fed177839ad@amd.com>
Date:   Tue, 3 Oct 2023 11:32:31 -0500
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
 <ad25d019-b2c9-4de9-ac5f-428c5e44f212@amd.com> <ZRwz6cEqnnwoVhTD@p14s>
From:   Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <ZRwz6cEqnnwoVhTD@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To BY5PR12MB3683.namprd12.prod.outlook.com
 (2603:10b6:a03:1a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3683:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 0332a3f5-9819-4c9f-2ece-08dbc42e591c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tnxoHVvz65YpUYISC2tkLzICK1ktE7J9DvfsabvXRxzXSR+iN17DFfQgb7NyULjswM4G04ujrh9Uixw1abn1+13MAAuvHE0OtS6NuW2z+mAoG1PYUtVZ3FpPWMy//bh+mPepGNJDu5Xl7j3DW0dbMyWcBikGgeBzR5peLudJaCahtbjwLWG3xvNWJBi3m2nyFqtd4wK0/7ua0sJPALqAJ9jDVrrjUUgyJSZFWbcmAMPRHGDmtdoKsErwG63u3e4MPlp07+ZGZt7GosQ/E8qMMFDs5Yfyi76/EyJSdtpMcIljnpH9jVRw1pFoVsdO38AFLseYRMz/jdNxZ8iL/O3dfZI/HI8ct+xIAjOUs5NGtKdync03UyT0KOjbDS4iy/J35OhZlnchE56TGhJtde9dwQQkbCMX4bj3E5ZK42Qp+qP9ngsR3Q+98hryRHwbS2hBXi3jYLakD7Zh1uCFgaIwYHErZc7RsGnbROc+toPqJTiyD7/7qMk8Vrfjifj4Yi0HfU3gd4H9K+FKb6jMIjqCBl581+4heujwyuURBrYMnBodlxj2+WEE7RQEkIZcJ9lHhXsZFt+U30FwB72EoTZzxZfHDtcDJnMKJpMIHzIObbytHopBK03awmY1ANoca5nv7qW8Xu/53igzxUBUiXJ5NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66946007)(31686004)(41300700001)(8676002)(66476007)(316002)(6512007)(6916009)(4326008)(8936002)(478600001)(66556008)(5660300002)(44832011)(6666004)(38100700002)(31696002)(6486002)(6506007)(53546011)(86362001)(2906002)(2616005)(83380400001)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVFYRjZLZjljOTc4UHF5cC8vVXNvZEN3a3h3N3FnRVRuNVExcW1UZkpGR0Nh?=
 =?utf-8?B?SHRTODR0TEJIUHlUcDZCbjM0ZzJFdldDRmxvdWhoSGFqS1hDTHBtVUYzS3Vt?=
 =?utf-8?B?K01ZR3EyR29BLzB3M0RBdTVPelZkUzhzZzU3UlQyOC9rUi9DZ2UrcGZ5SHJm?=
 =?utf-8?B?Y3JZUytoZGxPZWpEU053NlQwNXNVNlRhK1B4ZEVZRVoxYTJjcmRvM25EVUNx?=
 =?utf-8?B?QndXVFNBbzA4QXpnQW1lMk92NEhmVDZzSm5YZWRPeXRmMXNCVjFNME1XeVdD?=
 =?utf-8?B?OFU2d1RQQllpdzd1eTdibXhHU1JVelEwVnZLM0daSVRjcWgzUVVWYmJ5TCtE?=
 =?utf-8?B?ZVhjb0M1dmVTL1NEcVJseVFLcUpmVEFQNkZnRjJacnlzaHF5RWIvUTYwNmFh?=
 =?utf-8?B?bXlQTmF5Ymg2ZWpWMUhGcHlqNkdhV2VLWFI5RytqNkl3UUxMdnhKMjJieDBJ?=
 =?utf-8?B?VGNTWExRR1VJTEZHSFpxWUZZY1JOandoeUJMK2Ewb3dnVVZ3WFI4ZytDNUNL?=
 =?utf-8?B?ZVpuZk53M1FNMXhZVG9lbXNrY0wwT0JZMDc2TkN3MUIvRkhqRHhzL3dMMStQ?=
 =?utf-8?B?NDJaMVBmYTJVN2ZyVkE3ajk3bWFUajRLVk1uMmEyVWxaYlR3cVJyM2ZIRzha?=
 =?utf-8?B?NUloOXhvc2kzWUZ0MVQwMncxZ290SGpyZW55OHJsSGlNcTJzRzVzMTI2SXFF?=
 =?utf-8?B?S2RQdTZuR0VtVlBFcE94ZXR1SjAyV203WTlSVng0ZTdQaHEyYzFQdDdZOWF4?=
 =?utf-8?B?bWJFUzFFdkJkaHlTUnpTMjhMV3hINEJJRU1ySzBwajdqODVIYmsxMUUvWkY0?=
 =?utf-8?B?K2NsdEh2V0psSzlEdnVrWGNmZ1VLd3hNYlJybnkxaHlaVWR3T3R5RDgyYzM4?=
 =?utf-8?B?V01DRG9tOWlETkdmSHhuWjd2V0xXU3U0NmZoWXh3M0dGbldWRjd1OUkyUVZJ?=
 =?utf-8?B?VE1kTkdMREl2RTBmUGFrN1FZNk9FWHBRZDJOamYvb0M4MUJXOXBYVjBXbDVR?=
 =?utf-8?B?eUEvblhVZDJWR1N0VHVxU2p6NmE3S09VOTA2L1AvNTVXWk9IeHFoRjh1cHk3?=
 =?utf-8?B?TG92VzJRQmFLWVY5ekt5TTEvN0VHZklwNG9sc2dvUXV3d05yenMwR3cvd01M?=
 =?utf-8?B?Q0JuQlFqYVhzRlo5V0hvMU9WbGFjVVhMSjZRTjhEOVQ4ZjdLaEp6OTRSUFho?=
 =?utf-8?B?aW1kMExML2pkbjBZK3B6Y3ZVa3Eva1M1REprcWhnRWxrWnJ5NSszYzFBa1BW?=
 =?utf-8?B?cnU2SnpWb25ReE9SRm1wTTVKZEtKMEF1UXUrNmFCMmczTGM4ekIxK2pnK2NJ?=
 =?utf-8?B?bzNWeDc5VFdkQXpPbVpKN1FkTzYzMXZhUm9DeWJqeWRSUWFBY3ZoWnl6eFJN?=
 =?utf-8?B?cWRQaytIM0M3cW5vUnZqcXhXblAxU0hGSHZISU9pSXhHZDV4Qmo5Q2RuZ2xo?=
 =?utf-8?B?cGwxVEtESzJUdnBpeEFFYWoyS0JybVk3c3pBSmkrUWRNN3lqeFhNcGcxSWo4?=
 =?utf-8?B?WHk4U2VtUUVmcTBZY1kxbjRwVzRVTExLdlp1Q2N0Tnh0SUlHeHFEWk1SdURZ?=
 =?utf-8?B?NUlmN3Z0SFdTMGM0QXp4WTVHbHJKcENKNVpiRExPQWdqUVF3NTdQaUR6a3dZ?=
 =?utf-8?B?M3Jac2ZYdGtjbnBDeFJQR2JPOGZHdUNoMWJtQXFiWEFzUkJvaVVMZ2pyeVlT?=
 =?utf-8?B?K29aTDVPTGJlY2dUM1BwVUpFUWhrUVpIKzBPSit4aG9QZW1xQjN0RHUrZllZ?=
 =?utf-8?B?SHFZRWI0WlZnMGhTQ2Y3MmJWVVhuVkhVc3I2ZlRxZTlMVFEwak0rVWNScHU0?=
 =?utf-8?B?Z2xITlZYQUFkMmZWbE9meGNibDdlcjhLSnJ3dWRJd3M4VDlNWndjNTV3aWxL?=
 =?utf-8?B?UGtwek13WlNIL2NnenlsUHRycUVBWHBxNjkxbnpYUWxoUTAyNWRYLzcxM2o1?=
 =?utf-8?B?UUdWeUU1NFRWZmN0a0ZGRUNSMGdyNGhIY0RjVUVGZENRc3UwQklreUdwclll?=
 =?utf-8?B?U0h6R011cVVvR21wTC83YWJjWkJPbXprY250NnExL0xsTEIvb2lIeDlEdmYr?=
 =?utf-8?B?YXJXaGUrRXRyL25DZnFZZkZ3dkMwV3QxOFhvQkZOT3J2K05NQ3VVcFFrR0Jh?=
 =?utf-8?Q?gHT2GU1PzBsfcQLUJe2benYAd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0332a3f5-9819-4c9f-2ece-08dbc42e591c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 16:32:34.7901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXdrbKVS7M9YCzDe6RBEdVSHgZ3dpP8z5YxAyLLCal4pXSeiTZXb7S/TYBF+nOCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 10/3/23 10:31 AM, Mathieu Poirier wrote:
> On Mon, Oct 02, 2023 at 03:54:30PM -0500, Tanmay Shah wrote:
> > 
> > On 10/2/23 3:17 PM, Mathieu Poirier wrote:
> > > On Mon, 2 Oct 2023 at 11:12, Tanmay Shah <tanmay.shah@amd.com> wrote:
> > > >
> > > >
> > > > On 10/2/23 11:25 AM, Tanmay Shah wrote:
> > > > > Hi Mathieu,
> > > > >
> > > > > Thanks for the reviews. Please find my comments below.
> > > > >
> > > > > On 10/2/23 10:55 AM, Mathieu Poirier wrote:
> > > > > > On Thu, Sep 28, 2023 at 08:58:58AM -0700, Tanmay Shah wrote:
> > > > > > > Add properties as per new bindings in zynqmp remoteproc node
> > > > > > > to represent TCM address and size. This patch configures
> > > > > > > RPU in split mode and adds TCM information accordingly.
> > > > > > >
> > > > > >
> > > > > > Why is this changed from lockstep to split mode?  What about all the people out
> > > > > > there that are expecting a lockstep mode?
> > > > >
> > > > > I agree, this should have been in split mode in the first place as we would like to demonstrate use of both
> > > > >
> > > > > RPUs with two separate demo firmwares which is the best use of the
> > > > >
> > > > > hardware and the most preferred use of zynqmp platform by people. That motivates to change
> > > > >
> > > > > this to split mode.
> > > > >
> > > > >
> > > > > Now changing this may not be problem for lot of people with following reasons.
> > > > >
> > > > > The firmwares that are only using first 64KB of TCM memory, they can easily run in split mode as well.
> > > > >
> > > > > Also rpmsg vring information isn't available in device-tree yet, so I am hoping that firmware that
> > > > >
> > > > > are using upstream device-tree are not that big yet.
> > > > >
> > > > > If we change this to split mode before introducing rpmsg related nodes, I bet it will affect very less number of people.
> > > > >
> > > > >
> > > > > For lockstep mode the example is available in dt-bindings document.
> > > > >
> > >
> > > I could use the same argument for the split mode, i.e default is
> > > lockstep and there is an example in the dt-bindings document for split
> > > mode.
> > >
> > > > > So, if people need lockstep mode for any reason, all they need to change is xlnx,cluster-mode property from 0 to 1 and TCM nodes
> > > > >
> > > > > from bindings document.
> > > > >
> > > > >
> > > > > If you think it's crucial to mention all above, I can send new patch with all above info in commit message.
> > > >
> > > > Something to add to this. So, let's say if we don't change it now, what would be good time to change it?
> > > >
> > >
> > > The best way to go about this is to introduce another DT that is
> > > tailored for split mode.  That way people can choose to boot their
> > > device in a specific mode using the DT.  If you decide to go this way,
> > > look at how ST has split their DT for different boards - search for
> > > "m4_rproc" under " arch/arm/boot/dts/st".
> > 
> > Thanks for the suggestion. I looked at the example and I think it will work.
> > 
> > I have following idea.
> > 
> > So, if I understand this correctly, we introduce two separate nodes in device-tree.
> > 
> > SOC dtsi file: zynqmp.dtsi
> > 
> > remoteproc_lockstep: remoteproc@... {
> > 
> > . . .
> > 
> > status = "disabled";
>
> I don't think you need the "status"
>
> > 
> > };
> > 
> > 
> > remoteproc_split: remoteproc@... {
> > 
> >  . . .
> > 
> > status = "disabled";
> > 
> > };
> > 
> > 
> > And then in board dts enable whatever mode is needed for that board:
> > 
> > *zcu102*.dts
> > 
> > &remoteproc_split {
> > 
> > status = "okay";
> > 
> > };
>
> Exactly.  Again, I don't think the "status" is needed.

Thanks for the suggestion. Yes I think if we don't include status then both nodes are enabled by default, and people can

disable in board dts what they don't want.

Instead I keep status disabled, for one of the node, (for split probably as lockstep is already enabled) and people

can choose what they wnt.

Thanks,

Tanmay

>
> > 
> > This sounds like good idea, I hope this is what you mean.
> > 
> > Please let me know if I am missing something.
> > 
> > 
> > >
> > > > As I am hopping to use RPU1 as well with upstream device-tree. Please let me know some suggestion to work this.
> > > >
> > > > Thanks and again as always appreciate complete reviews,
> > > >
> > > > Tanmay
> > > >
> > > >
> > > > >
> > > > >
> > > > > >
> > > > > > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 28 ++++++++++++++++++++------
> > > > > > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > > > > index b61fc99cd911..01e12894c88e 100644
> > > > > > > --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > > > > @@ -247,19 +247,35 @@ fpga_full: fpga-full {
> > > > > > >           ranges;
> > > > > > >   };
> > > > > > >
> > > > > > > - remoteproc {
> > > > > > > + remoteproc@ffe00000 {
> > > > > > >           compatible = "xlnx,zynqmp-r5fss";
> > > > > > > -         xlnx,cluster-mode = <1>;
> > > > > > > +         xlnx,cluster-mode = <0>;
> > > > > > >
> > > > > > > -         r5f-0 {
> > > > > > > +         #address-cells = <2>;
> > > > > > > +         #size-cells = <2>;
> > > > > > > +
> > > > > > > +         ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
> > > > > > > +                  <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
> > > > > > > +                  <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> > > > > > > +                  <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> > > > > > > +
> > > > > > > +         r5f@0 {
> > > > > > >                   compatible = "xlnx,zynqmp-r5f";
> > > > > > > -                 power-domains = <&zynqmp_firmware PD_RPU_0>;
> > > > > > > +                 reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
> > > > > > > +                 reg-names = "atcm", "btcm";
> > > > > > > +                 power-domains = <&zynqmp_firmware PD_RPU_0>,
> > > > > > > +                                 <&zynqmp_firmware PD_R5_0_ATCM>,
> > > > > > > +                                 <&zynqmp_firmware PD_R5_0_BTCM>;
> > > > > > >                   memory-region = <&rproc_0_fw_image>;
> > > > > > >           };
> > > > > > >
> > > > > > > -         r5f-1 {
> > > > > > > +         r5f@1 {
> > > > > > >                   compatible = "xlnx,zynqmp-r5f";
> > > > > > > -                 power-domains = <&zynqmp_firmware PD_RPU_1>;
> > > > > > > +                 reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> > > > > > > +                 reg-names = "atcm", "btcm";
> > > > > > > +                 power-domains = <&zynqmp_firmware PD_RPU_1>,
> > > > > > > +                                 <&zynqmp_firmware PD_R5_1_ATCM>,
> > > > > > > +                                 <&zynqmp_firmware PD_R5_1_BTCM>;
> > > > > > >                   memory-region = <&rproc_1_fw_image>;
> > > > > > >           };
> > > > > > >   };
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >
