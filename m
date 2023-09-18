Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0619ECD37B0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Sep 2023 11:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241418AbjIRLGX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Sep 2023 07:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239871AbjIRLFz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Sep 2023 07:05:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA6CC3;
        Mon, 18 Sep 2023 04:05:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857E7C433C7;
        Mon, 18 Sep 2023 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695035149;
        bh=HqsMws0S5nYHBfNxFRC4VwWzZrM1nY/Eb3cwT5rJn5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CqCdEj7iTIHgp5d6BjvnkSieRxktCUrr9FV+8xBI5NBYv+AE+zFcTSKYOA+Hk7d+A
         /u3Xp9DmUSAbiAT77855XQ7sIP4QQKDhZ7krIEF8r1ZMCAKqUzY8P4+D7/unRxs0xF
         dD7naM3PuFGatTKQzpk2ZJFkZ8bhpfgLux+3KcC1C2Pa+sDWK4eB0S131tYzw+I4LD
         YFwOom+MS7yPM1o/4/LuT+PQOaTsZeeQBCxoTmghQyoRzRebrzS8CKig8sGGkxqTfO
         Z8vay8j09Q8CrmAzNF8wHRcMLFzTjJlkKg53+iVc+4l3wuBcl8hPlIxMc+jBMA2x0d
         Owi/2GGz7b94g==
From:   Will Deacon <will@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 00/14] Clean up RPM bus clocks remnants
Date:   Mon, 18 Sep 2023 12:05:19 +0100
Message-Id: <169502865701.264764.7151801488936699892.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 12 Sep 2023 15:31:38 +0200, Konrad Dybcio wrote:
> After the recent cleanups ([1], [2]) some in-tree abusers that directly
> accessed the RPM bus clocks, effectively circumventing and working
> against the efforts of the interconnect framework, were found.
> 
> Patches 1-5 drop deprecated references and the rest attempt to stop
> direct bus clock abuses.
> 
> [...]

Applied SMMU bindings fix to will (for-joerg/arm-smmu/fixes), thanks!

[04/14] dt-bindings: arm-smmu: Fix SDM630 clocks description
        https://git.kernel.org/will/c/938ba2f252a5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
