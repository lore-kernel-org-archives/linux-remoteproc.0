Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9EAC27C40
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Aug 2023 15:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242270AbjHXPlk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Aug 2023 11:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242279AbjHXPlN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Aug 2023 11:41:13 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44151198B
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Aug 2023 08:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXaelzXAq14ozNnVy/ud7QBHGBdberRs3UstA46YKxdv+MwS7YsQf2+6lqa1+V4wsOSps8AIB5Ag8EvVJYlqn6/RUYrK04eG+B9GJ3SYgIi8y1sIQMJeQq4eyH6V6EhgO9xeEc+sLu5/FeYaQD7SqdtXtXrIrrQeyJHevRG/r7u/5NJi1OgQ6di6kC19FxdWG5TflNB3GDRnzqIVoB9kgoqxmjXcL6WpxGMXOeBVQlacRWpmnJhvRp+XRL8KQX21dPy6O48kIfXpIzORzy+YrfitnrAORSXY1mJkjvVROTISIvdiIEQaXhKoBR1hSA1GCYr5VrtcYWQGw1xNPa21IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVuv+r7N8ZDncKNZhSP9LvGMj9ji2mbJrdsrruoFrKc=;
 b=RgGQUatZLfsisedv+a/aXGjKBiZ4AiQW2Ns2ImnmUX3Oy3OF+NyfP6uLKOvFXyuBYP1wxNUEMsGBY5n+g/GcqxWj3PxKYg80RrPokqLfMbp82aAiliT361yzn69YcnUE2H9quYj95yRdziVDF5zmaM/mb6f2uICLqAO2asvHc5LyPy0tVrQRftHYWnlZfJoIP+T8V8LcoHHQMnfkwSZ1Jidskn3OhuAMY5qxdbt0TTivrlu+Fq8C34NgpSseyA83d0yX+/8R9RWGJAhaK7vcDEOAXCxYHB1DZLh9XN+U7+7OD9zMfYyzycXtBOYYhlPQvrCu/DjHXmKRiAXT7wS0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVuv+r7N8ZDncKNZhSP9LvGMj9ji2mbJrdsrruoFrKc=;
 b=n3yZXDYb0EWfBFCECFDgDbR3JCGKb1D02a2LoczxyatlXzpmZIkZrhHATIyZrcUe+ZuLdwGBL8MG0Xa0pM2Vl6jJU14EfsbAZSiwW6KJsD0rRuUpn+ANDnNLTIGVvaXIkAgja6mxuWNxzAU4LREsUO7jBhcPFrBjF9ucLsluizg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB9819.eurprd04.prod.outlook.com (2603:10a6:10:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 15:41:08 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::ad2:49f8:14b:25c7]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::ad2:49f8:14b:25c7%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 15:41:08 +0000
Message-ID: <694492eb-2506-db1c-85e1-7126144cb5a1@nxp.com>
Date:   Thu, 24 Aug 2023 18:41:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Discussion about imx_dsp_rproc FW_READY policy
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     "S.j. Wang" <shengjiu.wang@nxp.com>,
        linux-remoteproc@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>,
        Daniel Baluta <daniel.baluta@gmail.com>,
        "arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>
References: <CAEnQRZAHzbCBuYvyTxzLJWmEUw4ytY+F8i_Qk0O9Z3ZW0L1bOg@mail.gmail.com>
 <CAEnQRZCqS4+zaUDrFVcHo+eu-8ko4WC2TQtuG=-b5qeA4YU=ew@mail.gmail.com>
 <ZOYwfs0f++QXUJ2j@p14s>
Content-Language: en-US
From:   Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <ZOYwfs0f++QXUJ2j@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|DB9PR04MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d2b36f-91c5-4fea-2d78-08dba4b88902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ir0Isxm2d5Sh7hQVxfnJHjlb0PgjHfFamUxy8ixjyNxwZgImXzHseuwYcXX45ygayL9b/rkwrNc/7a7rCtdMuP+OC5oEf7AkELlfNdEPZyC4p/oyIWQawhc/2EPPFm15m/aX5fHswg8P1EKC7JIExlwFvjaXuUbn30ZOeKNNYI3VD1mn5XBSvXIACROgMtZLEpTLpZ2//wAFiSbQU2XXgdUNeaD18dHUnpxwfIUFIL1t/KKkT4I8neMjKw33v9RCjCXn23xj/y9c8Kcinxq4ptn3UQ2yuG650yCHkDpJgiPLGh+0gAvoldoEykuLkrMtpRxqcen0whhggKrRG7PdQk+0TAkTD3tP9kS7X3ZyUOFwJwfTZF9O24+/zPWGWDI4ixPHJjg1ponfkvheGn/0nahgICNw7rqdQYzcpt0LPG9OCSC0uX459jJOeyGHHBBoKltwseEAy8N+rVp3dWoYZY3pi9m/8kuAwiO27ARw6spYTQmGiIR//u9VbJfg7KqKQ9HQki87u0ws620letQOp5EnNtv3RJPCg9UQUQDkTT7qWn7XgvhJa3x0o/g9kTJTKPCZoA944k3c0imh35ewiCcv0KpElq5CP15dNlnR5Zvj+EdeTJFK6TYOBPq+amW2jpnIFUP7/IBTdSUpmvHh4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(186009)(1800799009)(451199024)(2616005)(66899024)(5660300002)(8936002)(4326008)(8676002)(36756003)(83380400001)(44832011)(26005)(38100700002)(6666004)(66556008)(66946007)(66476007)(54906003)(6916009)(316002)(478600001)(966005)(45080400002)(31686004)(53546011)(41300700001)(2906002)(6506007)(6512007)(86362001)(31696002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW93Ly9IMC9yMzNqMGozZFhQMXVhRkNaYkVBMC8ydU81RXdpUzZWUlVuWm82?=
 =?utf-8?B?aU1DenVBVHppSDRaQVlWai9GVVNsMmhlNXZwTWhBWWxFWXJVVVdxWDM4WFIr?=
 =?utf-8?B?bWxZanNWdHJ2YXcrSXpwSGc2ZG5qckhsRU9LMGgxRHRVVG5NL2xlQ1JxM3hL?=
 =?utf-8?B?VjB6MG5iRHJqTVQyQWFPTmxQdGRhSXc1ZGpBSXFkWnNhMENFSjN6UmdhSmNx?=
 =?utf-8?B?a2hDUmR3Z2R6eHVHbGFYMjlBSkl0WEs3YnBQbWtyaDc1RWw2S1E5Qk9GVVl0?=
 =?utf-8?B?U3lwTFBSRlJYckZNcGdsdTg3eTNEQ2pTdi9yRnZhRGlRR1ZGcGZQWUZWR1l4?=
 =?utf-8?B?TmxPZjR1NVlrY0N2L3FqbzRqN21WUjdYUUpaYUZDb0pGaDdXUUVHbHFkSUY1?=
 =?utf-8?B?Q1F6S3B4WjR1cWdQRS91eitWWmZleXFBME9OdW5TRXQzcmhRYWlvSjAxSTVH?=
 =?utf-8?B?dlRXYzNwVFZ3blgwc2R6YzVpZUZNTkF6R0poTks3d3JaTjVBeFNqMEJTVkI0?=
 =?utf-8?B?Y1IyUyswcmRjSVAxV2toWTU4eXVjMVpuMTRGTGpxU1NrUUZheVVxb0lZbEpY?=
 =?utf-8?B?aktaYSt4SGJKdHQ5U3NoWUlqd2plbFZWeFJDVHRjODhaREZKeFBLclhUcDFj?=
 =?utf-8?B?a0xjY1pKWGJLRjJJaDNmY1JRNzR2dXhsRjJZWkdVV056dXpPNDg2QUlqbnp5?=
 =?utf-8?B?NW8yMEl0L2JTYW1WSVhIako0anJiS2w2OFllRGxHZ2VMbytyUFFvdGoxallC?=
 =?utf-8?B?QVY3OEZpZHhUMlBSSFFWQ2ZzODFEbGtOeHdOS2tJNmJ1N0gwb2RITTlORWdQ?=
 =?utf-8?B?YWNlTXkzWnp6cmJPNjlvNjc2MExQOEplVWpPd1B6MzVBN3hDa2QxdFFpQVlt?=
 =?utf-8?B?b2JXRDlZRFlzUGlwQzBQTGRGcnU1QmQwaU9nWUVBeWRtdS8vUGxId2RrTWp3?=
 =?utf-8?B?MHdURU40b2dwbDFialNoeHBoMDdmOUpuUzZFOVdrNnBkbTJma29XdkVwSEV1?=
 =?utf-8?B?UjgvQlprV3pNRzNKWk1BVTh1VzBZSTFLck84anhCd1hod1RkRWNBc08zRHVS?=
 =?utf-8?B?YWlIWmVjWWJJY3ZtUjNvV3AxYUJpZnBJTE9pN01GNEpjVUJlbmxud0UxV3VQ?=
 =?utf-8?B?ekRqMitFeWZ5QTNvaGt0ZGsvNmRUTkQyWlBMeDk4aXZMNkxZU2o2c1d6YmFk?=
 =?utf-8?B?b0ZrdGk4Z3FOY0VyNUtPVmRKcDArMW14U1FMQUZWYVJCaHF0R2VQSEo4MEll?=
 =?utf-8?B?eHdDbm5vS3lieDVUb3NvN21OSDl3YlFXc3lhRXBNMzJabEU0S0ZSM0V5RjBV?=
 =?utf-8?B?QkRrYTlCT0ZCeFhnWlRCYU1tQUVwZHV4VHFCbE15emNEWWFPRytSc0tmQlZP?=
 =?utf-8?B?cC9COUUxZ09hL2RpYlByOURPZGlpRDVCWGRCWjRjb2lTOEdUSG1rbmhBc2FD?=
 =?utf-8?B?ZERZZjJ6Z3dHVW43SnNkeW13eHlobkV1bzhJQ3A4ZnVzc0QvcFFxcE85RCs5?=
 =?utf-8?B?YzVydjgrQ0JoVFJ3bGFxcjZHblVnakkrZkh5TGw4SzFEazRHUWRKNC9YeUx2?=
 =?utf-8?B?akI2UGpxQitSZ0hWdTVLYldjQi92cnVTUzExdVhZL0I0ZElXalIwaEsxQVZ3?=
 =?utf-8?B?M1A0ZmtFRm9YOG1EUkVyc29PdEh0K25HSUM4QUJhcy80aDRNaTVFSzN4MUVi?=
 =?utf-8?B?Y2owYzdpU2Nnak1seXpDTm85WjV5UEY3dWk2T3VEckJ5bG1pc1NxSFBhNkVV?=
 =?utf-8?B?QmxocW5WSmkvUHRnbHU3L3ZFdVhQNlFZRjZ0ODlmVXJSR21CZi9qSEpoS1Rw?=
 =?utf-8?B?SmpLUFNkU3EzMDhwLzZibWFvQmhKTlY1N1VacFNFMzVNOFZ2cllRU3hKQ1Y3?=
 =?utf-8?B?djl5Vnd2MUcwK1VycktFZ2JRVVNiWjVTMHdCVmpQYUlXZFhqekpQTDJnbnlF?=
 =?utf-8?B?bVpZYWxVa3ZlMnYzRk5sMFUxUkFkMG9zZGl4d1NpaGNXS1NuY2dzMHZ0cUF6?=
 =?utf-8?B?VTZ4TXdLd21SNWlPWE1WOHhJdy9WdWFBWG5BcUN4Y1NrcDdVemVxRmI3czgv?=
 =?utf-8?B?aVFtSFdyamV0bzdxTmVTdkpzUVFVL1U1VENvcEMyNXhmWXFwNE5JRDd4dk9u?=
 =?utf-8?Q?QaIZHZZdZ6GXrbeuwZz4cHvKG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d2b36f-91c5-4fea-2d78-08dba4b88902
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 15:41:08.4366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4dWimr5XU2AYLNvVbVVGLLP4AUn17pwORuXU/S3wrQyXHwBFBQjI5XNZRL26enXrPtPyG7jlLLLFuaIjRSkiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9819
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 8/23/2023 7:14 PM, Mathieu Poirier wrote:
> On Tue, Aug 22, 2023 at 05:12:55PM +0300, Daniel Baluta wrote:
>> Hi Mathieu, S.J,
>>
>> Any comments about this?
>>
> All the questions raised below have been answered in my exchange with Iuliana,
> but I will complement herein.
>
>> I feel that the Linux kernel driver shouldn't enforce the policy of
>> waiting for a reply or confirmation that the firmware booted.
>>
> The protocol enacted between a remote processor and the host is very platform
> dependent.  The need to wait for a reply in the IMX DSP driver predates my time
> as maintainer of this subsystem and as such can't comment on the reasons it
> was introduced.  That said I am very disappointed by the complete silence from
> S.J and the rest of the people on the linux-imx mailing list regarding this
> issue.
>
>> The Linux kernel driver should offer a mechanism for checking this and
>> the policy should be set either in userspace or via dts.
>>
> This has already been discussed.  Adapting the Linux kernel driver for all the
> protocols that can be enacted by remote processors doesn't scale.  This is
> something that needs to happen in the FW and Iuliana's approach in [1] is
> appropriate.

Thank you, Mathieu!
I'll try to fix it in fw, continuing with [1] PR.

Iulia

>
> I think the pushback is caused by a lack of understanding of the problem by the
> maintainers.
>
> [1]. https://github.com/zephyrproject-rtos/zephyr/pull/61709
>
>> First option would be to have an ioctl but we need to also mirror this
>> in the sysfs interface. Second option would be to have a property in
>> the dts.
>>
>> What do you think?
>>
>> We are trying to fix this in the firmware side:
>>
>> https://github.com/zephyrproject-rtos/zephyr/pull/61709
>>
>> but we are getting some setbacks there too.
>>
>>
>> Daniel.
>>
>> On Wed, Jul 26, 2023 at 11:26 AM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>>> Hello all,
>>>
>>> I want to start this thread in order to clarify what assumptions a
>>> remoteproc driver is able to make
>>> about a firmware loaded on a remote processor.
>>>
>>> Discussion is generated by this thread:
>>>
>>> [1] https://www.spinics.net/lists/kernel/msg4857733.html
>>>
>>> imx_dsp_rproc driver assumes that the remote firmware will send a
>>> notification once it has booted up and this is the default behavior.
>>>
>>> This doesn't work well with Zephyr samples which do not send such notification!
>>>
>>> I want to get an agreement for the following questions:
>>>
>>> 1) What should be the default behavior of a remote proc driver?
>>>
>>> In my opinion it should not make any assumption about the remote part.
>>> Thus by default the driver should not wait for any message!
>>>
>>> 2) How can we support various "protocols" of starting up. Eg (wait for
>>> firmware / no wait for firmware).
>>>
>>> In patch [1] Iulia proposed to add a flag that will select the correct
>>> behavior. As per Mathieu's comments this doesn't
>>> scale up, for next flags.
>>>
>>> How can we solve this? In my opinion using a kernel module parameter
>>> OR a device tree property should be enough.
>>>
>>> What do you think?
>>>
>>> thanks,
>>> Daniel.
