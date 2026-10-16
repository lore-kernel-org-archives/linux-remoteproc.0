Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1CF377EAC;
	Fri, 16 Oct 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138824; cv=none; b=kDCRw+Y+q1E0aesAXoMH8M7wXUu+DBkwtrqwA8OYE9EUpOBP0xciUCGyi6VLGP7XLzly2yTPExqYOtkrBpqQ0lNw40yiY1/WI15v3DpuOhQkosfei427QaZKMjJx+0F4b7tPKyLfzDhR7OKtBFetNvqziTmf3+EhJeUGCh/9U2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138824; c=relaxed/simple;
	bh=g2sT6iwcmXxrJlW8h1kGgLLjxOStd1DO+EC7khWFXbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tome47vKfA++5DSQTMdGvORouirrhsM/5qGRx02Io3IsfL6cb0JRM0Be0LObKKOMQ/GP+7rc3BBos5pcggGXCH5mtDrfQDLryUEvS689ZQK4FaCCb1BpsZoyIyn6E3uQzYYWZVHfvdASjz+SBiaT2Dx//B/0Kg9sSNMjA5hUksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4tIXs5o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4tIXs5o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5704C2BCFD;
	Fri, 16 Oct 2026 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792138824;
	bh=g2sT6iwcmXxrJlW8h1kGgLLjxOStd1DO+EC7khWFXbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t4tIXs5oWiDE26gvilxzbRKwO2njH3OEZmxbbC0I46JyXhxRB+GBiXiZollRmfAX9
	 2mzufk/tg8dg/9JxYMQ6FiFGEdPVk3vZ4xyIU8pHq2Ag1kCV3VG/y5WzN45/0UtGUB
	 /HDoCV+Rxm+ejMt2f3RJC8BMRFX+9rA76Sx8pJfFObkOnjW1c1OZdTpD/mf+rhHOFs
	 lAMz77rZPqh+FMN/+Ser1BbZ5Cf6emHG0ByyQTuHQTYHuSOnU9IJuVATQrJQdEvkRD
	 rD6cYtAe9Yovzzb5IG0vQ6zh46z6aaqVsed7D9JpnLEjqNIY/jqrMeSYwwysd0lk5r
	 WhKkLlbf7VN+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF18CC6B38;
	Fri, 16 Oct 2026 08:20:23 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 16 Oct 2026 13:50:19 +0530
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SM7250 ADSP support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-adsp-sm7250-v1-2-2f39ac1f0496@brar.si>
References: <20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si>
In-Reply-To: <20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792138822; l=1106;
 i=patches@brar.si; h=from:subject:message-id;
 bh=B1Al454eYa4DdVDM6yrNOKl/Z5koP7bFA2fThKPNA7w=;
 b=1glpKh262yOUc6Fg21QDz/o6bf8qkbuu8b+s+2CW9PXTcKfi1qipd76+2oeC+SXxJ94TOfM27
 9g71SQFNknyC7kRUGgdoFT1Cs0TUpVjkMTWo2xeL9We6l4nf79Pvmgf
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

From: Ishu Brar <patches@brar.si>

The SM7250 ADSP uses the same PAS ID, crash reason SMEM item, SSR/sysmon
names and proxy power domains as the SM6350 one, so reuse its resource.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826..365f4fa5b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2046,6 +2046,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource },
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource },
 	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource },
+	{ .compatible = "qcom,sm7250-adsp-pas", .data = &sm6350_adsp_resource },
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource },
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource },
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init },

-- 
2.56.0


