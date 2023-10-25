Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9EFC25B47
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Oct 2023 08:51:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbjJYIva (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234006AbjJYIv2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Oct 2023 04:51:28 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3527B0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Oct 2023 01:51:26 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a86b6391e9so54053877b3.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Oct 2023 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223886; x=1698828686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tTFfq4D9p5xN0IQqJ2OvWJXv3Kfq9VWLuEHrieoLABs=;
        b=jjegFjEbrKowb9lpBmWFugprJkKVtP0R5e1BuFibXqhdbIk6kBfmB3/Af7+KJYMiGn
         IiOJAb7nbBFlN81mydQadJZjpaY+8mOQJ8JSJ8YWk8Hhzz8zdTQuolZy62PupVvhxPND
         M6AnvsWm3guF257y+DLL4UqWyRZjJjsHQmkb83TSc/fN/H6qKH/tXNpVcIImJuR7nj9W
         faV+IdUwbzkg/lNwN+a0O8a2tY5tkJf3HwoH1jVwwpGo0x+KutSJS0PA73/ihflfkinz
         C+ZmP9jARSPmhpwj1o7Hbku58WQRZxv7+2UoJGR0Q6m3b8pimo0ifYLY9FYiH3SSM+4M
         9Bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223886; x=1698828686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTFfq4D9p5xN0IQqJ2OvWJXv3Kfq9VWLuEHrieoLABs=;
        b=BW3GpUq847JvMGFrASyjlTK/Bc7PtVP83qxzwaSFl20POvYw4qTmxGWArn7hnOdf1Q
         lwP5C/xCklny8v6Udq7Nvd6RrdXVSg4el2o6BPFYLSZuSJUSFp8VyLFEyiDV8GkIKHMy
         5CwqRNvdFZDypnFWHXoe70qYEz8rDTjr0iXw0IKL2BlcgWujEgR6u7Yh60JDayDTWmJl
         RrMRRLWI9AbfGqr00Zrz0zEoOVQHLV7WAvAOlIRir4a1XyydjLA9kTOwO7jDIrJFTlI5
         wZ8cohmlLI7rLGAHxrju+P0Pp76O7a12/YIbcpcUycrmsYU7H7ie+hAFLchPz46mX2Ji
         8Biw==
X-Gm-Message-State: AOJu0Yyedrt7tUBntjo3nM6TBwGyKy7eDOYCpOM27d5rXGk3IOzDpDIR
        EXZ0TcetalrRU4EZAillui0KRaE5UTMinoEMTu8OiA==
X-Google-Smtp-Source: AGHT+IHhYmxcr42okUrf55P1D8yD7J3sM3R0RNmqCuwGbURggZDxK1dFQSu9KyEiIPEnyMPodJcNcgXhfKnr6kfMiKM=
X-Received: by 2002:a5b:94d:0:b0:d78:6f1:41b4 with SMTP id x13-20020a5b094d000000b00d7806f141b4mr13771717ybq.30.1698223885881;
 Wed, 25 Oct 2023 01:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-remoteproc-v1-0-a8d20e4ce18c@linaro.org>
 <20231025-topic-sm8650-upstream-remoteproc-v1-3-a8d20e4ce18c@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-remoteproc-v1-3-a8d20e4ce18c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 11:51:14 +0300
Message-ID: <CAA8EJprOkvBjx=QunK6r8WLhCzaLFY5-OXP0C1D4hwH8hy4wvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM8650 remoteproc support
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 25 Oct 2023 at 10:43, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DSP Peripheral Authentication Service support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
