Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CA3A16AB;
	Sun, 11 Oct 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723421; cv=none; b=sVQagoo87itFZvW+HjCJppjDTi879DdFffv43qcB7m6bkf+byo+QGyUkawcesfyWRHSnhXlHXwkudMpPbatYZbTUaeQM9ZwJCfBflQ/7ig+I4u1XQaIerXI4D95efkuRZfFa0nzn7dMeps8zGB4/ZE4rBUbek4GCPOAgaGcnVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723421; c=relaxed/simple;
	bh=RKNcrfw1cluWeUvBUixeWzgdlyKTKAg3kYTzzt8U2MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HKX4uuQVRNyQAtP5L5rvAB0spLW/xsEJS/PQnTWudYWtNOsxjX9zfN2ci/YGLVoTdfmtTDQ1DjRP8y3bAu/r72U8+DfmtA8HsFHm6HJdRmYEXyp530VgFX4DfMkDT6WB6n/pWJe5ZRY2EA7zhHRE/5SiYDHMuREvLAnDfJG3KE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=D28+fS9v; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="D28+fS9v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=K7Xxy87wbbHQEPXt8aN+q6SK4cbzyo3rw61fMQ8H2RM=; b=D28+fS9v/59oXXntgZxnEEpC8e
	fmw2LRW5BPwOdzrgCneNPhNgvVizO0u+yvrIXZc9k5ISddAwUJCeJBqBtRCn2iLXvLouZn6je8INr
	JKqka9qVxB+YUe9gXz5AQXXWwdhKOSoGFjlPgMzVq8/Yn+CDq7zfzBpomAe7gz/F//yU=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xFt6l-0000000H7HF-0iZr;
	Sun, 11 Oct 2026 15:56:56 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 11 Oct 2026 15:56:15 +0300
Subject: [PATCH] remoteproc: qcom: q6v5-mss: Fix memory banks count for
 SDM660
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxA0auUrA0kAQfxKuJiOk01SqcyaYtQe
 vdOdfkW/6/gWkwdrs0KRRdzG3MFnxpIz5gfitZVg5AEJmb0bgiBcHDHNua3YxrnPGGvTCHKheQ
 sUONP0d6+v/Ht/rfP7UvTdNxg23aVMkUEegAAAA==
X-Change-ID: 20261011-sdm660-mss-banks-count-fe106a280252
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0

As per downstream driver [1], SDM660's MSS version QDSP6v62 1.5 has 29
banks, not 28. Leaving something unpowered sounds bad and can potentially
cause unexpected crashes. This was missed during addition of the initial
support for SDM660 modem remoteproc, fix it.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/
    LA.UM.7.2.c25-11600-sdm660.0/drivers/soc/qcom/pil-q6v5.c#L508

Fixes: 10b6fec2c8c99 ("remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660")
Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff69..d159efbfe2fc1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -849,7 +849,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			} else {
 				/* MSS_MSM8998, MSS_SDM660 */
 				mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
-				i = 28;
+				/* SDM660 QDSP6v62 1.5 has one additional memory bank */
+				i = qproc->version == MSS_SDM660 ? 29 : 28;
 				reverse = 0;
 			}
 

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261011-sdm660-mss-banks-count-fe106a280252

Best regards,
--  
Alexey Minnekhanov <alexeymin@minlexx.ru>

