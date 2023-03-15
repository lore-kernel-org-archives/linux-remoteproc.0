Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19748C6FD1D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Mar 2023 23:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbjCOXtF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Mar 2023 19:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjCOXtE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Mar 2023 19:49:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DAF55B2;
        Wed, 15 Mar 2023 16:49:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F0694B81F4E;
        Wed, 15 Mar 2023 23:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99523C4339E;
        Wed, 15 Mar 2023 23:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678923159;
        bh=V/Z0f0cZlAcswOoBOoDprpItQqPHofsay60H0vvm0Zs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dqMxL3voxxPS/gEtwwSlDtEng6i+Y8KE5fM7BT/4jS5M/8FyqLJ7IxDXWZ0T3PfFi
         vaI/iYzea5Ehgfyjah3ERGyqr/PKsTUrKsflTUyxCs/JzCH0U/1cBH34l7CZT5lZlD
         DcdTZF3wTDDNm0FiuqLRujbqBwKWKbP748E2YIgyhuTQe5DR5uH96xGPzIDnVdX0kU
         r/MQWBQ9KS1Plj6NBkJ++vnDe35mduwy23Fa/dmS/sAYyQrW54A0b3IwweA6GOXq6f
         7G8pzr0HGdz1c5RttOPcqUxzfIX0/LWEZ19ZTf5mOnNwE/UggVss01rCkja15i/+yh
         vEE9607uCKLCQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM G-Link node with bindings
Date:   Wed, 15 Mar 2023 16:35:11 -0700
Message-Id: <167892332564.4030021.5571390998634849737.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 8 Feb 2023 11:15:39 +0100, Krzysztof Kozlowski wrote:
> Bindings expect (and most of DTS use) the RPM G-Link node name to be
> "rpm-requests".
> 
> 

Applied, thanks!

[5/7] dt-bindings: soc: qcom,apr: correct qcom,intents type
      commit: b5bec0f00ee1c52ff0965a5dba4c91c413a6f3de

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
