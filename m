Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB636C001B0
	for <linux-remoteproc@archiver.kernel.org>; Sat, 15 Jul 2023 22:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjGOWKT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 15 Jul 2023 18:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjGOWKS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 15 Jul 2023 18:10:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C072D63;
        Sat, 15 Jul 2023 15:10:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B45360C44;
        Sat, 15 Jul 2023 22:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A2FC433C7;
        Sat, 15 Jul 2023 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689459011;
        bh=+njgR16KeaRwaOnw3RjnYmJAzJ6KXN5pPE/bZ1BAMyE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nwhRBQQhoM24RB+AUbLJL17CZFOntpFGD7zVrISbaqpzdbXQhOOOwnmm6tyiCKI4I
         9dKggfWcw07uSpUoGwi5g41kNPdU34zEbgVDYOAe9cRgvD/S2CmT7UarUYRM2NeG9b
         clVOf/UDuOBdLDjyXOno6rnydQVjNw2qLBFaHXg6weYczvMGZQ/32PhQuKaIeMwa04
         APZ/UQryvUdU90yNYG+/TK8ckxOIBZrxZ0yxg5e9U0ICNhWCRY9lghQbVpXraLrF+l
         2HfcHK2F2vwcz96Y9OxYupv1kGF7UkSUJWGErbT/YYZebE0UEue95wNFnBmINUaFy3
         lFBONn/8TbHsw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: Add SDM660 compatible
Date:   Sat, 15 Jul 2023 15:13:27 -0700
Message-ID: <168945921479.1805013.17611108938068565205.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621175046.61521-1-alexeymin@postmarketos.org>
References: <20230621175046.61521-1-alexeymin@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Wed, 21 Jun 2023 20:50:44 +0300, Alexey Minnekhanov wrote:
> Mention sdm660-mss-pil in compatibles list.
> 
> 

Applied, thanks!

[1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: Add SDM660 compatible
      commit: ed50ac266f67829d4732c8ca61ef1953c2cc63d0
[2/3] remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660
      commit: 10b6fec2c8c99b5d1ccbcd070da1fc8e96da0046

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
