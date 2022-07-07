Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51F1C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jul 2022 07:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbiGGHBO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jul 2022 03:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbiGGHAj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jul 2022 03:00:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC7332041
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jul 2022 23:59:53 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i18so29529068lfu.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jul 2022 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=uudX0qE0EodfyOAtpNxIObBg7BD+vU4kR+vip3L6w9k=;
        b=XsaW2j2vWBNrkQD0Fkp2Ibp4T8yUX5Vd0jRIPq7pCGZnJUMW/1yeRbtYaC/4RWKbkL
         fowDz3z3jCu3YlbuSB5fRE8RglF22BzYSMoUWun72K9H9J1hmkk8BDKj/zODSARvMPZ2
         wrTK/RMs3N0l0XFlAbYzNbW+qreJjh2u4vLBg6qPtbrakn0mKck6vvZoWO6k6tOO1bly
         51suRCchE8Xzi05t3h8NwHY+XoK/76sJXG0iP+ZQZDiJn56PQFIXvoheT97e34vb+huE
         5wc8fpGFr2NOf+g0cY+MdlEewqLNrXysmhaMw1+UQ/VoybbIHj8mg3ADwJyxdx+Vs5xT
         lq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uudX0qE0EodfyOAtpNxIObBg7BD+vU4kR+vip3L6w9k=;
        b=e/ESy/0QqGjgDgjVi7ujfgq6wzOlvpwPuXdh1eHLflAwZd8+2aEWX27PkTAvCRMOFi
         yjRaMhlSqcII9KqcSjh/JssCxgh8xy2Eye23PyfEJYRccx85glwPZKQD1/I0GtZp3cCN
         ymc8W0MqDKVBH3Iy1FTYC1JWaeazPhsjxgLB01fRGQYOeYLQgMveuMYrF+J7XUZ+jO9G
         D0TCa081u4mPR355npUsaRMYW3HeoioiP0Rs4Dkv8iQNu3XRN9B7RRFqneLgGh19zcgx
         jeGjnKl4yvon20L0AyRDpcjmXYYl/4AfMCIqajpJx8uAx6HF6pLj2YmnL0IcHvW6Qabv
         qWzA==
X-Gm-Message-State: AJIora808WMHkPNtsoFXE+cNgbZ1+Pim/ScMc5T8M+RyCtuCIZxG/zUD
        2pq7zlKfqN+6FtxmukvnB4LRpw==
X-Google-Smtp-Source: AGRyM1uDcC2/uLeUv+nYCg4YXUX0JLtGsAJ2rhsItJBnSNg3ojhNi98v7mFkxoLbyJVzOpFG4NQ1lg==
X-Received: by 2002:a05:6512:1303:b0:482:d0df:280f with SMTP id x3-20020a056512130300b00482d0df280fmr10006946lfu.14.1657177191963;
        Wed, 06 Jul 2022 23:59:51 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id v27-20020ac258fb000000b00478f739f1fdsm1047602lfo.103.2022.07.06.23.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:59:51 -0700 (PDT)
Message-ID: <98f7c329-b4b8-f7d6-33b4-b8471f23d174@linaro.org>
Date:   Thu, 7 Jul 2022 08:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] ARM: dts: qcom: add missing smem compatible for
 ipq8064 dtsi
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220707013017.26654-1-ansuelsmth@gmail.com>
 <20220707013017.26654-3-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707013017.26654-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/07/2022 03:30, Christian Marangi wrote:
> Add missing smem compatible and hwlocks binding for ipq8064 dtsi

s/binding/phandle/


Best regards,
Krzysztof
