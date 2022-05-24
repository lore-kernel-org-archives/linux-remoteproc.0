Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CC2C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 May 2022 02:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbiEXCA2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 May 2022 22:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbiEXCA2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 May 2022 22:00:28 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9207CB0E;
        Mon, 23 May 2022 19:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653357627; x=1684893627;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=YPB0asuW4QnalTPM5VsbF/tGwT6gB2yuiGMXkA+T7fA=;
  b=CBoNZ5okCX8eyUaTSrgo7dN/xkEk2Y9QIcjoB9yG2AViLJGMDrL8jyMy
   mXdtPdJ22hFO+hRVvoSulGV8j1ApM0gaf1giYVssW7T51PiMlZgltrbNQ
   EavOoSWMBSx26nZi/s+09N/9Hvduk+gDWfGwSY4PZVLjOksolNz/e/Nsn
   4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 May 2022 19:00:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 19:00:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 23 May 2022 19:00:25 -0700
Received: from [10.79.43.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 23 May
 2022 19:00:21 -0700
Subject: Re: [PATCH v4 3/3] dt-bindings: remoteproc: qcom: Convert SC7180 MSS
 bindings to YAML
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     <bjorn.andersson@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <ohad@wizery.com>, <agross@kernel.org>,
        <mathieu.poirier@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <mka@chromium.org>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com>
 <1652978825-5304-4-git-send-email-quic_sibis@quicinc.com>
 <20220520224011.GA374485-robh@kernel.org>
 <371ce290-1deb-bff2-112b-71be8c005b37@linaro.org>
From:   Sibi Sankar <quic_sibis@quicinc.com>
Message-ID: <a5ad7884-d2c5-aeb0-405e-0121bb51f0a1@quicinc.com>
Date:   Tue, 24 May 2022 07:30:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <371ce290-1deb-bff2-112b-71be8c005b37@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Rob/Krzysztof,

On 5/21/22 8:04 PM, Krzysztof Kozlowski wrote:
> On 21/05/2022 00:40, Rob Herring wrote:
>> On Thu, May 19, 2022 at 10:17:05PM +0530, Sibi Sankar wrote:
>>> Convert SC7180 MSS PIL loading bindings to YAML.
>>
>> I suppose there is a reason the sc7180 is being split out and the only
>> one converted, but this doesn't tell me.
> 
> I am also confused, especially that last time I pointed out that there
> is work already:
> https://lore.kernel.org/all/20220511161602.117772-7-sireeshkodali1@gmail.com/

https://lore.kernel.org/all/e3543961-1645-b02a-c869-f8fa1ad2d41c@quicinc.com/#t

The reason for the split was discussed on the list ^^, thought it
wouldn't make much sense adding any of it to the commit message.
Also since Krzysztof said he wanted a alignment between Sireesh/me
we did exchange mails saying I'll take care of SC7180/SC7280 (since
they had pas compatible which is overridden by mss compatible) and
he could continue with the rest.

-Sibi

> 
> 
> Best regards,
> Krzysztof
> 
