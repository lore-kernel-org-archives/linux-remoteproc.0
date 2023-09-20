Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6217DC04AB4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 Sep 2023 17:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbjITRKk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Sep 2023 13:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235310AbjITRK0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Sep 2023 13:10:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534E8F4;
        Wed, 20 Sep 2023 10:10:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA92C43397;
        Wed, 20 Sep 2023 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695229819;
        bh=GtxNzXrdVQp3KK1fl0MVslj0u/GM1KmyJHWHlPDOTzM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JwawKQd6VbJi24u5AJRoeawiTVZe5p3O8/qYKTCP097RnfuNDgMDZ7+LbKP6hcaGq
         mD2wLGu4bi+qK6AOsUF/pMEVS2A9SSr2yp1LnUu0Viz5HLqiKKaKkvjKho0q3iXauu
         3TkVN0yCDFqia6rjM9XGPYYWbPimqUFp+1RN+cA9zAxm6h5UQMQ8YIiQgNLIwD8Osz
         k8M75bHFcsbSfidu0Ty7VgY0SJbLA5XcxWGQgt82Q2KVhU4imgZyPz3LJxSj+t1edw
         5se1HaijC/iD3/pUeeD3GVFpEfeBb5zqU9Xy/2a19pfEE16smTgf3tKwJRCt4cRim8
         r5g5S6upzVgyQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] sc7180: Add ADSP
Date:   Wed, 20 Sep 2023 10:14:06 -0700
Message-ID: <169523004968.2665018.1443667905220127425.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru>
References: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Thu, 07 Sep 2023 15:02:33 +0500, Nikita Travkin wrote:
> sc7180 has an ADSP remoteproc that can be used to control the sound
> hardware. This remoteproc has to be used on those devices that use
> Qualcomm firmware and thus are locked out of driving the lpass directly.
> 
> Introducing the ADSP would allow multiple WoA laptops such as Aspire 1
> to provide sound. It's also useful for the sm7125 devices that are to be
> included to the kernel [1]
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sc7180: Add tertiary mi2s pinctrl
      commit: 828298a9efb237b76fa667bb74a6450d1df3eeed
[4/4] arm64: dts: qcom: sc7180: Add ADSP
      commit: a3d5fb3b084c0c67f9918a866b92cbe09b9e1d77

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
