Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BC1E77361
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 20:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjJBUj0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 16:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjJBUjZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 16:39:25 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35139BF;
        Mon,  2 Oct 2023 13:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIjPLC+f9I0MLQsNplYU+YR1pRt9U67jIfgLBr8nH06ccaIdKPJX4cMUoYZ69wYqonDpGQcbCAw53i0rSBuQbUUaekrquX4EjXnxz3TNl+4oRr+cjfvUQVsgx4OEJabTYSvxea4RXSTM6dxLnnFbhp1wJfLVX9SXePDwZa1CwuBksgmm6e9AUtf4FotiHE7ph++JrwLUY/FqDsnOEio4XbrS0sDoC/avLwg4wNklEMzHg8AxJhSVcBq70rKDOzFFbI++y7l9z5nxuvJjoPujapWA/4zTE85jVLU2IxCF33O6pE54njwPunWwpOvHUmnWNgoUmvYqa2EQDiTdHfDh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuDk59cK96qzH+LkOu9N3bRZ4eXJn4bs0PnrZ8Sy+bo=;
 b=nlFn+YF4fdLMYKepHeARJQiAnvGe8ZnucZcOVG//YCK2ZNQZ2/RD95uUkAyPXUN198xAUgvJJNBLTFFWdst/S1CqUmK6KGd24oZHfLZSLuwnqxMT/nTC4LSvKypL/hjGANC0ly8npg6ikR9coblwaeFjcoitPP1CQm9nuUSbiTUc6y9QKP2eGMUoXP8k3FAgE1/9ELBjPNRzUYWU6to8SYLtIejiaN9yrkbznr7aabeqglj8ztHxuoDINaSJ69Gt/IZtKnk+uMuCxxxcAJT0Oh3nd/GsNGgUrcqY3QVVOoVmDrmsxvEcpH6wtP/Fowo2zfd5jafp4miuevBVNFYePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuDk59cK96qzH+LkOu9N3bRZ4eXJn4bs0PnrZ8Sy+bo=;
 b=NYcFbJahWg0tqNHUBbSiBHHZ+ux3pB6oU5GcOfmUdIrqyOMTlzqk9BX9h1M/zoUM31WhaeqLylnNb+q4ypG8Z+57pAnjH+CG2qFHWwBnZIm9NABNVxIWWYEmNKfGEW6ndzyXttOl6jt4+dJGZM+HcYSsF37Lpj4Q/EZGaEP1F9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3683.namprd12.prod.outlook.com (2603:10b6:a03:1a5::16)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 20:39:17 +0000
Received: from BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb]) by BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::8304:46bd:5017:3dcb%7]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 20:39:17 +0000
Message-ID: <4cd0d913-dabc-41a7-a71d-8d48ca68995d@amd.com>
Date:   Mon, 2 Oct 2023 15:39:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] remoteproc: zynqmp: add pm domains support
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        radhey.shyam.pandey@amd.com, ben.levinsky@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
 <20230928155900.3987103-4-tanmay.shah@amd.com> <ZRr5xI1w4Pd3/8+S@p14s>
From:   Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <ZRr5xI1w4Pd3/8+S@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To BY5PR12MB3683.namprd12.prod.outlook.com
 (2603:10b6:a03:1a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3683:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 051781cc-fd8b-4e1f-55f4-08dbc387a5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OR+Zg6y1u75kIVzg32HX7M3ePdDrpmfJIE3VF1vN6s7Jmff8Z7UN5jw2UzwNy39tY0+KX9qswhAAZcJOUPb1kLS8ODvUtZycBicidOT4a1II7b2PyWEvBqMgonrDG4AxE9WTQIacUqFEsYZXJSVFdhdTmNS6sU7zKXSzfhvKBZfvuZmivQw6Z8Zcr3gUTekv1CKHOBlMiGuDk63ZEEs+xRBxD8J/xYBkoq9anMGBArZkYaJed/3pLlTP4irTB0sWnc5bjdbLE5IlHq5IJmMCA5hF9qh1hnym70ZDuTm6t5OxSVUeZnsFXm/tOMkF3sVVFXkv3fTXYpZTnEl7fPcFMguNovhdi5m62TTf/2rLFYYdAE61k0RdIDzBV0kdKSARtmzzmv/EX8g8iAEXzYM44hrJ8HSIGmbM4j/+2qLf5TuMUWcY2DAel/FXfPdQ3FAJHjNt97yz5O+3MqAVbmN7UUEstxVy+5u1x7xLSQSkhiogn6MiNT9UB2lfBRzGT2lNg8iWDrM0IWEAuza6QmXGMLqAsjIaphWsl983IVsdoiEVTt1za8YNoyclrw11tw4rdxqh7P3Ii6yoxClFMoEYPPS8I8c/fbIK2Sn26qISPM4FBknvX2NnnOEaQmNYH907pNHHC0ZIm1F7ZxbmaY4/1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(6666004)(478600001)(6486002)(53546011)(83380400001)(2616005)(26005)(6512007)(2906002)(30864003)(41300700001)(4326008)(66556008)(6916009)(5660300002)(316002)(8936002)(66476007)(8676002)(66946007)(36756003)(44832011)(31696002)(86362001)(38100700002)(66899024)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRBTGg4ck45UVZmRDZrblUrMHZkNldjZWNmRmt3d21lMGNmQkpuOUlkcnJE?=
 =?utf-8?B?bVJqcW9BQzQ1b1k2U0tQTzI1bjZrOU1mSlArMUs4RlBGb2w0a2loWDVqcGpq?=
 =?utf-8?B?WFVoSVNYZWhIYURPSWt0Q2tSOW1OSC8zYStscUdRekJDUDVpNy8xd3R6K0ND?=
 =?utf-8?B?VnNreHk0Z2lvWURIbms1MTRKLzZTYm5nYzJ4WEVRYncwL2JhZDNlQVcrYVhm?=
 =?utf-8?B?RjlBYWZmRFN1QitXOG1TaHEvZzlQL3VVVGpTL2hudDI2OW51LzNOemxOYzl1?=
 =?utf-8?B?MnNoZkJoTkc0VTAwZmQyVzY0VzBJY1M4V2dyTUk1NTAxeE1HRGVHQkh2R04w?=
 =?utf-8?B?WVd6VE5uOThpZmt6WmZYSERocS94Kys2S1l5dU1NMXJOa0h5WnkxZE14bmd5?=
 =?utf-8?B?ZXZsM3VUNlB6cThPbHZsRGI4cHBJcDVNV1NPazhkOThUQXBFd045MEhaYUh5?=
 =?utf-8?B?VjgvSjlwblczengrc2NWWXRhVER1R3ZMQVRJSlpNNjhIS3ArZ29lWitld2s0?=
 =?utf-8?B?TGZSRHNtTXFEaUphcnh0bmRxVURUb0hWYWowUkVLRzRmZXNLNytPZXp1dExm?=
 =?utf-8?B?aC9YYjRUTlZuLzRYemFEcDhTYkEyOXdrMjk2dEdXVzBRTGM2ZHhlWWswUndH?=
 =?utf-8?B?dVp6YXBLNGtoRzhtTVBiL0FTSXdBc3lIclR1SGlOSEhienlpdEhSa0hmMzJ4?=
 =?utf-8?B?cmJrS1BzWkRUMUpOMUpmSWYzVWNTby9WTFk3QSt1WHgyeDdwdlFnL3k3UlVI?=
 =?utf-8?B?RVBjQjlMcVpEYmU3UnpvWEtSZHVCVUIzVUhqTjR4K2c3dWRnNnUwRVlnR095?=
 =?utf-8?B?SkZxdjJJK1hLbnZWZ1ZFajY0UWNWN2hoZnNzcVBJVk5jNjg0dHdWUXBUT0xG?=
 =?utf-8?B?enAwTU9nMU9pZDdGSmJpRXlYVEtKM0FRRlRmZCt5YzdZRmEreGJCaDVReDlI?=
 =?utf-8?B?T2JsenNSR05qaDM0cWI2a29wcXNLT0NnNE55Q3k1a2l1eGlNMWVsdGc2T2FU?=
 =?utf-8?B?dFc1QjlXMk5meW1LQUFxZXFUWXZNcGRhajRkNUlwZm5EYnVVUUFLRUpqTDhR?=
 =?utf-8?B?QWN4SFgxNGZ2RndLdVZnU21qTmNXZ2NtMGtMTjRnQjljN2FlSVdPT2ZmOGd6?=
 =?utf-8?B?d0RHQS9VcVB2c1ZvcE04MGE5ZmUwNWdmL09vRlBJZnU5Vk1jcVBhZTR1bCs2?=
 =?utf-8?B?dGh2ZWxIb3BqZ2YzMkM1Tkc2RzRVZFFNUmtGTGRqU1k5UEsxeWRvZS9BTlo4?=
 =?utf-8?B?SG1pdW9tTFlKL3VPazM5Q0xONW4vNmJNVWdXMENCYm1NNkI3QVp2TU0xY1B3?=
 =?utf-8?B?UjY4dTVCelAzTitZalhELzljNWRXbTk5Y3RoN2E1M2l1MTIzMTN5Z0VEOTRE?=
 =?utf-8?B?NTZqNmV2bndsdW9qZ0Y5RFBTZlQ0bWpaZmNBbFFBWWJ3RlRuR3h4bTBLdCto?=
 =?utf-8?B?dHl6aGhHTVFtSFBCR0hRSkkwUkVtaXJsNVBkY205T2F2RThPOHpTS2REQjc3?=
 =?utf-8?B?MnJkN2lhdS90OTFrblRmZ2ZvV3FoVmRlR244bEg4Tm9kQVh4TUFvUE5aTEtX?=
 =?utf-8?B?cUlRMkRZNzN1OWQ3M3llMlJtTCtHYjRod0xXWXJja0lCbzBVK1RCM3pjS1lF?=
 =?utf-8?B?MmV1cVVLc3NsNHVFdEtYZEswS0k3OFFxSVVPTDFIN05QZ0xMdlJ3QkdCa1Iz?=
 =?utf-8?B?eTFFTzZkNDFlY2tDMjZQRXVBQnVWbmIxUmhLMzFXK2Jsb3NhQXo2eXA2dkZU?=
 =?utf-8?B?MndTNk9LSVh5ajZCNkxDbldVUXBjRk95a1piM29ZdVVzMWdrRmQ2UlF2TWYv?=
 =?utf-8?B?bTJ6SllNbGhSRTFTWEdDMGpMNmhISnNaR2JISEZ6akZ6RmRvaDlCNmlScHhX?=
 =?utf-8?B?Y0tPTXZIZW45c0JIOHlSd1pQQ2F2MUtzWlk5M0lJQTVTbHpSdldMVjlzcFZ6?=
 =?utf-8?B?TVp5MG1mbjE5TUUyRjZCRGNZdjZ5STRXNWtuUkcvTGQvMkoxVFJidnlTbWJz?=
 =?utf-8?B?S3VQMDNPRWU1YW1HdXVnQXoxM2loNjJaNXpyVTdHN1R1SkNvOG5DVGlUSFFV?=
 =?utf-8?B?Z0RHdmtlRWFDU1JLZmlONEh6Y1Z3cmVkTE9MbEZEdUtzUWcyYVVvRmhOb3Vn?=
 =?utf-8?Q?24iapRtlBufVF/vtfVLFrvf2B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051781cc-fd8b-4e1f-55f4-08dbc387a5ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 20:39:17.5162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV5NdIFmi3+NnhWnaiWLNu34vUSgWc4SiKScDdZiIBjxoYa5+c50NCkCHrbchhsk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Mathiew,

Thanks for reviews.

On 10/2/23 12:11 PM, Mathieu Poirier wrote:
> On Thu, Sep 28, 2023 at 08:58:59AM -0700, Tanmay Shah wrote:
> > Use TCM pm domains extracted from device-tree
> > to power on/off TCM using general pm domain framework
> > 
> > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > ---
> >  drivers/remoteproc/xlnx_r5_remoteproc.c | 224 ++++++++++++++++++++++--
> >  1 file changed, 205 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > index 4395edea9a64..27ed2c070ebb 100644
> > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/pm_domain.h>
> >  
> >  #include "remoteproc_internal.h"
> >  
> > @@ -102,6 +103,12 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >   * @rproc: rproc handle
> >   * @pm_domain_id: RPU CPU power domain id
> >   * @ipi: pointer to mailbox information
> > + * @num_pm_dev: number of tcm pm domain devices for this core
> > + * @pm_dev1: pm domain virtual devices for power domain framework
> > + * @pm_dev_link1: pm domain device links after registration
> > + * @pm_dev2: used only in lockstep mode. second core's pm domain virtual devices
> > + * @pm_dev_link2: used only in lockstep mode. second core's pm device links after
> > + * registration
> >   */
> >  struct zynqmp_r5_core {
> >  	struct device *dev;
> > @@ -111,6 +118,11 @@ struct zynqmp_r5_core {
> >  	struct rproc *rproc;
> >  	u32 pm_domain_id;
> >  	struct mbox_info *ipi;
> > +	int num_pm_dev;
> > +	struct device **pm_dev1;
> > +	struct device_link **pm_dev_link1;
> > +	struct device **pm_dev2;
> > +	struct device_link **pm_dev_link2;
> >  };
> >  
> >  /**
> > @@ -575,12 +587,21 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
> >  		bank_size = r5_core->tcm_banks[i]->size;
> >  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> >  
> > -		ret = zynqmp_pm_request_node(pm_domain_id,
> > -					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > -					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > -		if (ret < 0) {
> > -			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> > -			goto release_tcm_split;
> > +		/*
> > +		 * If TCM information is available in device-tree then
> > +		 * in that case, pm domain framework will power on/off TCM.
> > +		 * In that case pm_domain_id is set to 0. If hardcode
> > +		 * bindings from driver is used, then only this driver will
> > +		 * use pm_domain_id.
> > +		 */
> > +		if (pm_domain_id) {
> > +			ret = zynqmp_pm_request_node(pm_domain_id,
> > +						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > +						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > +			if (ret < 0) {
> > +				dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> > +				goto release_tcm_split;
> > +			}
> >  		}
> >  
> >  		dev_dbg(dev, "TCM carveout split mode %s addr=%llx, da=0x%x, size=0x%lx",
> > @@ -646,13 +667,16 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
> >  	for (i = 0; i < num_banks; i++) {
> >  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> >  
> > -		/* Turn on each TCM bank individually */
> > -		ret = zynqmp_pm_request_node(pm_domain_id,
> > -					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > -					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > -		if (ret < 0) {
> > -			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> > -			goto release_tcm_lockstep;
> > +		if (pm_domain_id) {
> > +			/* Turn on each TCM bank individually */
> > +			ret = zynqmp_pm_request_node(pm_domain_id,
> > +						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > +						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > +			if (ret < 0) {
> > +				dev_err(dev, "failed to turn on TCM 0x%x",
> > +					pm_domain_id);
> > +				goto release_tcm_lockstep;
> > +			}
> >  		}
> >  
> >  		bank_size = r5_core->tcm_banks[i]->size;
> > @@ -687,8 +711,10 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
> >  	/* If failed, Turn off all TCM banks turned on before */
> >  	for (i--; i >= 0; i--) {
> >  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> > -		zynqmp_pm_release_node(pm_domain_id);
> > +		if (pm_domain_id)
> > +			zynqmp_pm_release_node(pm_domain_id);
> >  	}
> > +
>
> Spurious change

Ack, will remove it.

>
> >  	return ret;
> >  }
> >  
> > @@ -758,6 +784,153 @@ static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >  	return ret;
> >  }
> >  
> > +static void zynqmp_r5_remove_pm_domains(struct rproc *rproc)
> > +{
> > +	struct zynqmp_r5_core *r5_core = rproc->priv;
> > +	struct device *dev = r5_core->dev;
> > +	struct zynqmp_r5_cluster *cluster;
> > +	int i;
> > +
> > +	cluster = platform_get_drvdata(to_platform_device(dev->parent));
> > +
> > +	for (i = 0; i < r5_core->num_pm_dev; i++) {
> > +		if (r5_core->pm_dev_link1 && r5_core->pm_dev_link1[i])
> > +			device_link_del(r5_core->pm_dev_link1[i]);
> > +		if (r5_core->pm_dev1 && !IS_ERR_OR_NULL(r5_core->pm_dev1[i]))
> > +			dev_pm_domain_detach(r5_core->pm_dev1[i], false);
> > +	}
> > +
>
> A global function such as this one should not have to deal with error
> conditions.  Those should be dealt with in the allocation function where cleanup
> is done on error conditions.  See my comment below in
> zynqmp_r5_add_pm_domains().

Ack, I won't use IS_ERR_OR_NULL here. Instead will make sure that if this function is called,

all the pm domains are acquired successfully.

> > +	kfree(r5_core->pm_dev1);
> > +	r5_core->pm_dev1 = NULL;
> > +	kfree(r5_core->pm_dev_link1);
> > +	r5_core->pm_dev_link1 = NULL;
> > +
> > +	if (cluster->mode == SPLIT_MODE) {
> > +		r5_core->num_pm_dev = 0;
> > +		return;
> > +	}
> > +
> > +	for (i = 0; i < r5_core->num_pm_dev; i++) {
> > +		if (r5_core->pm_dev_link2 && r5_core->pm_dev_link2[i])
> > +			device_link_del(r5_core->pm_dev_link2[i]);
> > +		if (r5_core->pm_dev2 && !IS_ERR_OR_NULL(r5_core->pm_dev2[i]))
> > +			dev_pm_domain_detach(r5_core->pm_dev2[i], false);
> > +	}
> > +
> > +	kfree(r5_core->pm_dev2);
> > +	r5_core->pm_dev2 = NULL;
> > +	kfree(r5_core->pm_dev_link2);
> > +	r5_core->pm_dev_link2 = NULL;
> > +	r5_core->num_pm_dev = 0;
> > +}
> > +
> > +static int zynqmp_r5_add_pm_domains(struct rproc *rproc)
> > +{
> > +	struct zynqmp_r5_core *r5_core = rproc->priv;
> > +	struct device *dev = r5_core->dev, *dev2;
> > +	struct zynqmp_r5_cluster *cluster;
> > +	struct platform_device *pdev;
> > +	struct device_node *np;
> > +	int i, num_pm_dev, ret;
>
> I'm not sure 'ret' is needed - see below.

You are right. It's not needed. will fix it.


>
> > +
> > +	cluster = platform_get_drvdata(to_platform_device(dev->parent));
>
> Why not use dev_get_drvdata() as it is done elsewhere in this driver?
>
> > +
> > +	/* get number of power-domains */
> > +	num_pm_dev = of_count_phandle_with_args(r5_core->np, "power-domains",
> > +						"#power-domain-cells");
> > +
> > +	if (num_pm_dev <= 0)
> > +		return -EINVAL;
> > +
> > +	r5_core->pm_dev1 = kcalloc(num_pm_dev,
> > +				   sizeof(struct device *),
> > +				   GFP_KERNEL);
> > +	if (!r5_core->pm_dev1)
> > +		ret = -ENOMEM;
>
> What's the goal of the assignment?  Did you mean to return an error instead?

Ack, it should have been return. I implemented multiple ways to return errors, and missed to fix this before sending the patch.

>
> > +
> > +	r5_core->pm_dev_link1 = kcalloc(num_pm_dev,
> > +					sizeof(struct device_link *),
> > +					GFP_KERNEL);
> > +	if (!r5_core->pm_dev_link1)
> > +		return -ENOMEM;
>
> In case of error, always cleanup the work done in the current function.  That
> way cleanup functions such as zynqmp_r5_remove_pm_domains() are simple and easy
> to read.

Ack. I will make sure that if we fail here for any reason, all the memory allocated is freed

here. Also any acquired devices and pm domains should be detached and released in this function

only upon failure in between.

Thanks,

Tanmay

>
> > +
> > +	r5_core->num_pm_dev = num_pm_dev;
> > +
> > +	/* for zynqmp we only add TCM power domains and not core's power domain */
> > +	for (i = 1; i < r5_core->num_pm_dev; i++) {
> > +		r5_core->pm_dev1[i] = dev_pm_domain_attach_by_id(dev, i);
> > +		if (IS_ERR(r5_core->pm_dev1[i])) {
> > +			dev_dbg(dev, "failed to attach pm domain %d\n", i);
> > +			return PTR_ERR(r5_core->pm_dev1[i]);
> > +		}
> > +		if (!r5_core->pm_dev1[i]) {
> > +			dev_dbg(dev, "can't attach to pm domain %d\n", i);
> > +			return -EINVAL;
> > +		}
> > +
> > +		r5_core->pm_dev_link1[i] = device_link_add(dev, r5_core->pm_dev1[i],
> > +							   DL_FLAG_STATELESS |
> > +							   DL_FLAG_RPM_ACTIVE |
> > +							   DL_FLAG_PM_RUNTIME);
> > +		if (!r5_core->pm_dev_link1[i]) {
> > +			dev_pm_domain_detach(r5_core->pm_dev1[i], true);
> > +			r5_core->pm_dev1[i] = NULL;
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	if (cluster->mode == SPLIT_MODE)
> > +		return 0;
> > +
> > +	r5_core->pm_dev2 = kcalloc(num_pm_dev,
> > +				   sizeof(struct device *),
> > +				   GFP_KERNEL);
> > +	if (!r5_core->pm_dev2)
> > +		return -ENOMEM;
> > +
> > +	r5_core->pm_dev_link2 = kcalloc(num_pm_dev,
> > +					sizeof(struct device_link *),
> > +					GFP_KERNEL);
> > +	if (!r5_core->pm_dev_link2)
> > +		return -ENOMEM;
> > +
> > +	/* get second core's device to detach its power-domains */
> > +	np = of_get_next_child(cluster->dev->of_node, of_node_get(dev->of_node));
> > +
> > +	pdev = of_find_device_by_node(np);
> > +	if (!pdev) {
> > +		dev_err(cluster->dev, "core1 platform device not available\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev2 = &pdev->dev;
> > +
> > +	/* for zynqmp we only add TCM power domains and not core's power domain */
> > +	for (i = 1; i < r5_core->num_pm_dev; i++) {
> > +		r5_core->pm_dev2[i] = dev_pm_domain_attach_by_id(dev2, i);
> > +		if (IS_ERR(r5_core->pm_dev2[i])) {
> > +			dev_dbg(dev, "can't attach to pm domain %d\n", i);
> > +			return PTR_ERR(r5_core->pm_dev2[i]);
> > +		}
> > +		if (!r5_core->pm_dev2[i]) {
> > +			dev_dbg(dev, "can't attach to pm domain %d\n", i);
> > +			return -EINVAL;
> > +		}
> > +
> > +		r5_core->pm_dev_link2[i] = device_link_add(dev, r5_core->pm_dev2[i],
> > +							   DL_FLAG_STATELESS |
> > +							   DL_FLAG_RPM_ACTIVE |
> > +							   DL_FLAG_PM_RUNTIME);
> > +		if (!r5_core->pm_dev_link2[i]) {
> > +			dev_pm_domain_detach(r5_core->pm_dev2[i], true);
> > +			r5_core->pm_dev2[i] = NULL;
> > +			return -ENODEV;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * zynqmp_r5_rproc_prepare()
> >   * adds carveouts for TCM bank and reserved memory regions
> > @@ -770,19 +943,30 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
> >  {
> >  	int ret;
> >  
> > +	ret = zynqmp_r5_add_pm_domains(rproc);
> > +	if (ret) {
> > +		dev_err(&rproc->dev, "failed to add pm domains\n");
> > +		goto fail_prepare;
> > +	}
> > +
> >  	ret = add_tcm_banks(rproc);
> >  	if (ret) {
> >  		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> > -		return ret;
> > +		goto fail_prepare;
> >  	}
> >  
> >  	ret = add_mem_regions_carveout(rproc);
> >  	if (ret) {
> >  		dev_err(&rproc->dev, "failed to get reserve mem regions %d\n", ret);
> > -		return ret;
> > +		goto fail_prepare;
> >  	}
> >  
> >  	return 0;
> > +
> > +fail_prepare:
> > +	zynqmp_r5_remove_pm_domains(rproc);
> > +
> > +	return ret;
> >  }
> >  
> >  /**
> > @@ -801,11 +985,13 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
> >  
> >  	r5_core = rproc->priv;
> >  
> > +	zynqmp_r5_remove_pm_domains(rproc);
> > +
> >  	for (i = 0; i < r5_core->tcm_bank_count; i++) {
> >  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> > -		if (zynqmp_pm_release_node(pm_domain_id))
> > -			dev_warn(r5_core->dev,
> > -				 "can't turn off TCM bank 0x%x", pm_domain_id);
> > +		if (pm_domain_id && zynqmp_pm_release_node(pm_domain_id))
> > +			dev_dbg(r5_core->dev,
> > +				"can't turn off TCM bank 0x%x", pm_domain_id);
> >  	}
> >  
> >  	return 0;
> > -- 
> > 2.25.1
> > 
