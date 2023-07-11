Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F37AEB64DD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Jul 2023 06:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjGKG6S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGKG6R (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Jul 2023 02:58:17 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2091.outbound.protection.outlook.com [40.107.105.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050F718D;
        Mon, 10 Jul 2023 23:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzr4bxTawMQx79iSt+0121ghj04Th6fw4b8Rmsq0wiTjAhiWHnOxjXSvt3SOPjTiKwRfm1JPE//XbF/zBeEyYZWdlxqzV+455y0QkV0XaRNiS+wOxCbpG1YdNVhg9F2Buu3pAmydOq6ZR3vdb5ujHwsKtl2UttOck1F0Jt8gqNA1H+DZcwYteNWg8UN+D4EJSogWgSMtjQv8EEwW5lK7ey4Fv5mfpY6HhV5U0G+O76c5Ah1m16bpY2bEaVuLST+dy1fOEeLeyyBvv7oXX6Yv33HN835SdH9kewqA31xNu34AXYSqdPE1U3DU0mLGxRWZgPkFVC2R/ADvZEhcJTJZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcQiiAbNjCaXBQ1V23uPMnu2j1ybJKQhcIjFqGv9Fjw=;
 b=SqTPolxpEQ3fTFQ3IpRScpGDxJ7A1HBSDKmr3x8O94DJBM9IHNIsGh+boRAA1nLm7Pti+v6dFTqm7pk7Z4h+02W+uXUt5P6mySGcbMgDQ5R+lx8Xe/C4xfw9LJAtY2S3AZlbyTqNp/wxsHHnnD2CBYU3jg44Xhg5LH3+b3WRVYEC0BusbGd/04MPBYOIek2K7JDaL4WdTGXwnQkfxUdyjrmfnqk3ZsCzK06c4n6K2kXN4REl5+vjvN0AcyzV6OD9erY88r3HLK+mQRE28jvV41pD5QZWdYK5W3JoDxaWpk4onoES2F/Y7nBFnLEk52D2Ub1X4dwIvJZ8BUJ5p1+jKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcQiiAbNjCaXBQ1V23uPMnu2j1ybJKQhcIjFqGv9Fjw=;
 b=Uew2NvkVmorwswRbpqnr9TnZjjcgmyhk+FSGSeIwUYheUrwzw3GGAzIC9H7m71Zno8Q839vm1A4dM+fTqy6nue9qDlJpPXmdMS5916JfnxudOYI4mlCv199Z0u8O9tvFg9IohgUIuUbDhN6Uue2mhJruLAr5/0eyQOciv27OIL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB7500.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 06:58:13 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 06:58:12 +0000
Message-ID: <282f950c-c37e-c36f-7ac8-19e28e3d13b4@kontron.de>
Date:   Tue, 11 Jul 2023 08:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Content-Language: en-US, de-DE
To:     Marek Vasut <marex@denx.de>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230707232444.374431-1-marex@denx.de>
 <8f40484e-1721-a2bc-2344-f9e59e51a935@linaro.org>
 <d3180b8f-96d6-380b-4518-17334a90799d@denx.de>
 <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
 <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de>
 <51a1c2e9-1165-c7ff-809d-b09e09d776e2@linaro.org>
 <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
 <CANLsYkyWCaSwiL=nOSG1efw069GKEeK2nYkYeMVT7bx0329Bgw@mail.gmail.com>
 <38b62bf0-018a-03b9-3107-23f91fe3fa35@denx.de>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <38b62bf0-018a-03b9-3107-23f91fe3fa35@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR07CA0007.eurprd07.prod.outlook.com
 (2603:10a6:205:1::20) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf67e67-6133-424a-1eb6-08db81dc3193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k458zvlyg/B6JAzpfL85md7S2Y19ZLBaABEbltVqrZfSsawfcg9cfXz+bvbsIk/lF/PzvHBDRW3nZYs0god6TnIteIDH057JsWJwZdmMNIy9WIbGUK3AX/W78PVEsCMHamED9TM4yeDs2inQEjAUPucA/9pjOSz4fvrNhig6x7tyrgn5i/dFhCd4CAa5RlPhN+/cH176r4U2kQDLaSFqpD97CEY7Bk35GdxI1s6VbBaV/qKBWngifYpC+1BrOvPvXRD3bY0qwNPOszZhwkL/4jyJDicGxvYnqoiuhdihzHlgZLGK8uY8P+s3obWPIZL4OwM4pLoilNdcqRFbvVGjk2o7r6UVv36vldsXus3Bg9NjoEzNf8XtZv2CM9cPGHiA0RAHAPD+ZVu0/HVVwttJ+uHnb0x7lkpEaTSkHqfFs3KX0nuABtTBMtqlOTtEg7r4oyNStPuYInuMUGsittXUtXazIuImD7d2RvynaoxOEFZFFKkJR3T9e+VLCoDJVOGGZpziwJrAIxaNDvgZAKWp/LP5wSKaniYxIVsHeFUC/8ZV9dhv1M/lXXRROWn9eFlrIgSJtJkkUD8ZSj+d4gsmJSeuB27PvGVB0voKVfmXZiUnLd5iJI0zssD5q31lcvsPzkNnK0C3SP8oCbdKQEBju/SqiovJXEjAyG9Vz0/jISg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(5660300002)(478600001)(45080400002)(41300700001)(6486002)(6512007)(966005)(316002)(4326008)(53546011)(7416002)(186003)(6506007)(26005)(54906003)(66946007)(66556008)(6666004)(31686004)(110136005)(66476007)(44832011)(2906002)(2616005)(83380400001)(38100700002)(31696002)(86362001)(36756003)(533714005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NSt1d2g5TkQ3TmlqZ25sWG5MVWI4RFFFUzJXaFUrejZqRFRNZGRaQzl1amZD?=
 =?utf-8?B?RW16Q25xZGp1aDF0Qk9HZHA5YWJqOTh1N3Y2MldoOExscElRWWt1elREQkwr?=
 =?utf-8?B?amIvSG1ub0NLbmY5ZjJpK25aMEQ3WW9CdVAySEdnWGhRTjJweERha1ZtUitj?=
 =?utf-8?B?dXl6QmJXcXdrVzljRmg0emh3RHBWTk1aRVU4RndVZEQyaFE0YlBSc3Q0YTF3?=
 =?utf-8?B?ZzJNa0tydjlhQUs1blBaN3JyQTJXUi9JK1hCVktlUW94Q2dNRzM5S1luNWVM?=
 =?utf-8?B?OFpWdXlFTmNsV201cmppY2l2Y0NuSEJMWWZOdGNrWG5wbjB1RVVZMFhqdXh4?=
 =?utf-8?B?Q25EVjNlUC9CTUUyNEdCZ0ZoaWc0akt4WHdpdWNmZUNLRjI2U20vK1Bjckw4?=
 =?utf-8?B?RDcrZ3J1enFIanMxbWdMREExdXZXZmFCSVJqajZibjdKM2wxeUp1NUFBWWUy?=
 =?utf-8?B?WUJoWVVHblVzcGtxTTlzdnRYTndoZ291aFV3N3hkbG40WkQ2eHQ1TUlEUUor?=
 =?utf-8?B?cVUweGJWcWduS1lnRHVla1dIblduRjFmc2RnTUxJU1hNWE03OTd1Z3U1MlF1?=
 =?utf-8?B?b25SaGdHNG5SWDNEMHlzV2Mxd1crN2NxQzJRenBZVk9jY0JnZjNJOHdiNG4r?=
 =?utf-8?B?OXFLNkgwV0tsZzF6YkgwbFFmSlFta3cvR25LeTVGVU1kaXZ1dmZ6MFJwNmFk?=
 =?utf-8?B?Mi9ObndkZEZzSmpRSWVFZ2xRQjhXbnNwakJDUkNsc3FsdnZhS1ZCSWZsSUVO?=
 =?utf-8?B?R0VjdllFenlNSDYvR1dMRkpsbW5GV3hzc1NyS3FBd2JFMUljVTNReENtSHEw?=
 =?utf-8?B?eGx4VlE2bWtFQTJUZXN3bWtVRktWZWlkL0FzcTBTTTIrbEZYYU9XcDM4dm1o?=
 =?utf-8?B?WnBlalVoSnA2empPdlF4cnhaK3ZjQnFPVllQS0RoQ3FwY2hGMklNUFFKMVZZ?=
 =?utf-8?B?N25HRGRWSk9aV1ZHdFZucmxaV2VxWUkrbG54a0lDU2RTU1NYUzJ1Q1QrVDBX?=
 =?utf-8?B?ZGhqbGdjYllxU3FlaExlUDMrYUxvc3pSdk9sZTdNWWRtUUJiTmw3WTVLMDRQ?=
 =?utf-8?B?cEc3Q3o5TkxONEdDOGY3clVzbGNOeEJkc0FERXNxTVpjNVBpa2h0MTJmUVhZ?=
 =?utf-8?B?MTJxQXRvSDJXZFVRZHBOVmNOTlNRbkRjaVJjeVE3Z1BJZk9jUnEyYlJ6NU1m?=
 =?utf-8?B?RDh0Y1ZXMlloR1UrMmQ2S290Q2FQVzVzM3FTYnhFZTYzcVZuMlQyK0kwUFZz?=
 =?utf-8?B?YVJUY2NQWTBuZFRHYmNHaHpBOU5JOGxGdDMvSzF2S1VMREpXdjFlMytIUG1N?=
 =?utf-8?B?V3NFMXcybkZrbFIwUnZNZEkxUUVsL2RKYjBIY1BMdjJBV2RJK3F5Q0xVSGI5?=
 =?utf-8?B?bUhaWk1QM3Zvd3hRRWNvWjV0anRsZ0lvVFp3d1ZGT0d3RHJMYVhscC9aK1FZ?=
 =?utf-8?B?OGRPSE5oVC81ZGtReUE5cDA5Y3YwVlVpWHVVSi8rM2ZBSE84UGxSRFhZL0lN?=
 =?utf-8?B?RmQ5WXl2UFEzNmllS3VlRnpkMWl6MXdMNk11Q1I5NG0vd1laUE80dUNCeFo0?=
 =?utf-8?B?Y2svQit0YmpkYkplQyt4Y05nWEVlNkJueEM5RkY2aWVZdzF0dGozdlIyRWw1?=
 =?utf-8?B?c2hQVTJKVWt1bVpJeUdGWk10cmM0a3hlNnhnNlRsaFZuUFJKZkVtY0VxSHZ6?=
 =?utf-8?B?cG5CcnFpZzM4S0tvS0NPTWZCYnBPZU5wUno3Wnl2VFJZTGZ4T0YvOGpmNlp1?=
 =?utf-8?B?YlV1bENEOE5hNDZMYXBWME55ZWRFVmJVMFVnV0lPcWVyMFVOK2JSNVFhcHli?=
 =?utf-8?B?WEhNWVYyMk9UazFjMzA0aEZhdU0zNHdhUzlPQklmQnRMeVd2NmJlb0pIdW45?=
 =?utf-8?B?YzNYSVZwdEgvWUt0Yy96Z2NVeEFBNjlyMnR0azBSQ0Z6MGlmZ1BWMVB1SFRY?=
 =?utf-8?B?S3BReXNvWWsxYjFSV1hWVllSUmhGRGxXVEt5TUswWlFVbGpxcDdLbVNKMUcx?=
 =?utf-8?B?cGYvb3ZJdFVBZTQ3R3RBVWo1N0p2RkhlRTVZUzVidWZnMXFmZklHRU5ERE5q?=
 =?utf-8?B?cEVFd0VGS3V2ZWRoRHI2M3AxTHlTV2pvT1hkbTU5N1hZeERybUpOeTZEdmcv?=
 =?utf-8?B?dlZZNi9SazhZenBKOGxhb1BYczJTc3RNTnNlTjE0Q1B1ZWFqVG1BN01ySWxI?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf67e67-6133-424a-1eb6-08db81dc3193
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 06:58:12.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ct/lzYT/pAZDVcqCYoxfMOwAcJGjTRiqBzTrcpJBE+5Bn3c3nBQupdGEVmZXqcaiVTp/7xaZaG51i+kN4pL+ZjrKF4h2K1M24hAz/ZANOTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7500
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 11.07.23 00:23, Marek Vasut wrote:
> On 7/11/23 00:01, Mathieu Poirier wrote:
>> On Mon, 10 Jul 2023 at 15:53, Marek Vasut <marex@denx.de> wrote:
>>>
>>> On 7/10/23 22:00, Krzysztof Kozlowski wrote:
>>>> On 10/07/2023 15:46, Marek Vasut wrote:
>>>>> On 7/10/23 14:52, Krzysztof Kozlowski wrote:
>>>>>> On 10/07/2023 11:18, Marek Vasut wrote:
>>>>>>> On 7/10/23 10:12, Krzysztof Kozlowski wrote:
>>>>>>>> On 08/07/2023 01:24, Marek Vasut wrote:
>>>>>>>>> Document fsl,startup-delay-ms property which indicates how long
>>>>>>>>> the system software should wait until attempting to communicate
>>>>>>>>> with the CM firmware. This gives the CM firmware a bit of time
>>>>>>>>> to boot and get ready for communication.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>>>> ---
>>>>>>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>>>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>>>>>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>>>>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>>>>>> Cc: devicetree@vger.kernel.org
>>>>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>>>>> Cc: linux-remoteproc@vger.kernel.org
>>>>>>>>> ---
>>>>>>>>>     
>>>>>>>>> .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        |
>>>>>>>>> 5 +++++
>>>>>>>>>      1 file changed, 5 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git
>>>>>>>>> a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>>> index 0c3910f152d1d..c940199ce89df 100644
>>>>>>>>> ---
>>>>>>>>> a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>>> +++
>>>>>>>>> b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>>> @@ -76,6 +76,11 @@ properties:
>>>>>>>>>            This property is to specify the resource id of the
>>>>>>>>> remote processor in SoC
>>>>>>>>>            which supports SCFW
>>>>>>>>>
>>>>>>>>> +  fsl,startup-delay-ms:
>>>>>>>>> +    default: 0
>>>>>>>>> +    description:
>>>>>>>>> +      CM firmware start up delay.
>>>>>>>>
>>>>>>>> I don't see particular improvements from v2 and no responses
>>>>>>>> addressing
>>>>>>>> my comment:
>>>>>>>> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
>>>>>>>
>>>>>>> I wasn't aware of this being submitted before, esp. since I wrote
>>>>>>> the
>>>>>>> binding document from scratch. Which comment is not addressed,
>>>>>>> the type
>>>>>>> ref is not present and the sentence starts with caps, so what is
>>>>>>> missing ?
>>>>>>
>>>>>>
>>>>>> That the property looks like a hacky solution to some SW problem. Why
>>>>>> this delay should be different on different boards?
>>>>>
>>>>> It probably depends more on the CM4 firmware that is being
>>>>> launched. The
>>>>> ones I tested were fine with 50..500ms delay, but the delay was always
>>>>> needed.
>>>>
>>>> If this is for some official remoteproc FW running on M4
>>>
>>> It is not, it is some SDK which can be downloaded from NXP website,
>>> which can then be used to compile the firmware blob. The license is
>>> BSD-3 however, so it is conductive to producing binaries without
>>> matching sources ...
>>>
>>
>> Why can't the SDK be upgraded to provide some kind of hand-shake
>> mechanism, as suggested when I first reviewed this patchset?
> 
> I'd argue because of legacy firmware that is already deployed.
> New firmware builds can, old ones probably cannot be fixed.
> 
> Do you have a suggestion how such a mechanism should look like?
> As far as I can tell, the MX8M SDK stuff looks very similar to the STM32
> Cube stuff, so maybe the mechanism is already there ?

I also stumbled upon this problem [1] and I also wonder why this is
specific to NXP or how other AMP systems like STM32MP1 solve this!?

The problem is that the CM4 firmware first needs to register some IRQs
for the mailbox before it can handle the incoming rpmsg messages. No
matter how the firmware is implemented, there will always be a delay
between starting the app and having the IRQ handlers registered.

Without looking at the details, the proper solution would probably be to
implement a way of signaling that the CM4 firmware is ready for incoming
messages and the rproc driver to wait for this signal before trying to
initialize the rpmsg.

[1]
http://lists.infradead.org/pipermail/linux-arm-kernel/2023-March/822285.html
