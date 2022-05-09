Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE83C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 May 2022 19:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240742AbiEIT7F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 May 2022 15:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240711AbiEIT7A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 May 2022 15:59:00 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774AC7223A
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 May 2022 12:55:05 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id qe3-20020a17090b4f8300b001dc24e4da73so327261pjb.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 May 2022 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Kh+QQ/TxXS1NVKYU2dj8970PKcONRYGyMb573yL70Zs=;
        b=DB5AMq154uPVEABPd/Ht20m9xAuHdLPAIpLNbV2AUd+Xl3o5PSogp22tXDaf8adH/V
         thnCPnxPBairN5psa5Q3YUT6K4ogh3mhaBxf8XJNroaaR0CdTMSXlGfdIopfPo7ebDAN
         AEoxTBUl1A2BS1estbYeGlGjmqCX74SR2d4XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kh+QQ/TxXS1NVKYU2dj8970PKcONRYGyMb573yL70Zs=;
        b=EkLh2qUhPsMoeDOTrlM7e7e6flylyiXt43H5IKYtakMfjrY46FDpZUJBwACfDOgnt0
         k04KWj/KKconJ/xsLknYqocLvyl/ARLCRI+YjcQpL4awqiI4XpBW2f4VYspOHwTvMstM
         MJ3xAQAIJvXwV5kz9Nc/ULr+mN+sZhUKTYwo5+9BYj4PwU2ZXA1Tg0yoSH/ooZFmjM6d
         aLc71M/6WRLmfAh/6OrhrNB5t4MAxqZ/lqGBsS3jUSOOGRxrsIsjNijKitc7HAR00nzt
         0MyBqQTkBTAqj1IEOQF5ENCN00zQErJsCWOhyOQ9OkIDWDliqIHH1SjR+Ima8YXMIEOL
         8E0w==
X-Gm-Message-State: AOAM531wDfrVN1yUlaMjNI3otmSH/3k9vMHJ5BmHDwZgWw8IKI9Pp/qW
        4zYbZUkD0HzYxGFzeyBaVYGDPg==
X-Google-Smtp-Source: ABdhPJweHWgd7qc2MqEdODa2jlyfVzb0XNyTHa8rV9JgRxEzF16wLYb7GsZAb9n2TCoNDkBKkyCnUw==
X-Received: by 2002:a17:90b:314e:b0:1dc:d143:a15d with SMTP id ip14-20020a17090b314e00b001dcd143a15dmr20698782pjb.111.1652126105085;
        Mon, 09 May 2022 12:55:05 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:753:614a:caf8:e14d])
        by smtp.gmail.com with UTF8SMTPSA id w19-20020a170903311300b0015e8d4eb2a2sm229445plc.236.2022.05.09.12.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 12:55:04 -0700 (PDT)
Date:   Mon, 9 May 2022 12:55:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org, swboyd@chromium.org,
        krzysztof.kozlowski@canonical.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
Message-ID: <Ynlxlz7brLWZFRnd@google.com>
References: <1652082798-5855-1-git-send-email-quic_sibis@quicinc.com>
 <1652082798-5855-3-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652082798-5855-3-git-send-email-quic_sibis@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, May 09, 2022 at 01:23:18PM +0530, Sibi Sankar wrote:
> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
