Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651CAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 May 2022 11:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240578AbiEJLHV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 10 May 2022 07:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiEJLHU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 May 2022 07:07:20 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26A42689C3;
        Tue, 10 May 2022 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652180604; x=1683716604;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=iZPt7xQxjEGn8QDNOKqdIh9o3A44rM/7ljJ6ROd0WQc=;
  b=cAu0BchxjCjo2cay2IFh2a0IsJUVZujdhUbpwBcep90xzT1vBYdP+Ps3
   bm1E66jvO4dPZWTMcA5aRrreqswejSv/ocELZwZnv9YC43dSunS2mOGaY
   27UNeuVzOcCqURvnUj9TGUyZCUibeYN55nV17dqftUgzsmj4VWaBT/aO1
   g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 10 May 2022 04:03:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 04:03:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 04:03:22 -0700
Received: from [10.79.43.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 04:03:14 -0700
Subject: Re: [PATCH 0/3] Add support for proxy interconnect bandwidth votes
From:   Sibi Sankar <quic_sibis@quicinc.com>
To:     Stephen Boyd <swboyd@chromium.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>
CC:     <ohad@wizery.com>, <agross@kernel.org>,
        <mathieu.poirier@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <evgreen@chromium.org>,
        <dianders@chromium.org>, <mka@chromium.org>,
        <krzysztof.kozlowski@canonical.com>
References: <1644813252-12897-1-git-send-email-quic_sibis@quicinc.com>
 <CAE-0n51qygskCKAv7MwJmM8BVV2D0wT46YCBwxtGKybP4QA+jQ@mail.gmail.com>
 <8a4ee54e-f648-97a9-e9a6-ccae6ca8ce10@quicinc.com>
Message-ID: <69584259-64a2-41fc-c2db-3b45422a9c36@quicinc.com>
Date:   Tue, 10 May 2022 16:33:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8a4ee54e-f648-97a9-e9a6-ccae6ca8ce10@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5/10/22 4:29 PM, Sibi Sankar wrote:
> On 4/5/22 4:47 AM, Stephen Boyd wrote:
>> Quoting Sibi Sankar (2022-02-13 20:34:09)
>>> Add support for proxy interconnect bandwidth votes during modem 
>>> bootup on
>>> SC7280 SoCs.
>>>
>>> Sibi Sankar (3):
>>>    dt-bindings: remoteproc: qcom: Add interconnects property
>>>    remoteproc: qcom_q6v5_mss: Add support for interconnect bandwidth
>>>      voting
>>>    arm64: dts: qcom: sc7280: Add proxy interconnect requirements for
>>>      modem
>>
>> Is this patch series going to be resent? Does it need to be applied to
>> sc7180 as well?
> 
> Stephen,
> The proxy votes are needed on SC7180.

Sorry I meant to say they aren't needed on SC7180.

> 
> -Sibi
>>
