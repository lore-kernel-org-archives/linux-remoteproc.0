Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990612;
	b=lEApOqRRcXKtjuImFfyMC0YLbbaA0JjLceulIELTTwmckWhPh63R7zRZcSZPyChXBVkC
	 TO+93qoIie91UujPjPxNZgNRaf2Oi0qpcVQLQ8RIoRqTLWKvjipuylRHgc38M4yGJStdU
	 TNLth1C4Q3UQSOtItY5Oq6JHdOdlgBheMcwWF2ZYGBF2HQGxHmo4H2xZGII8M1Q9pmSGP
	 I6IZSWZcWOSZIJc+bNK/DdUzjRCCPJyEW7v4t/oADKXzCKWqEdOyfu3Me8xwomIcaYXRk
	 7XxD5ZXeOZeNmkF6LJDtVVUf1NcoSP4lEs+bqTNUeyJ/FYtZo1zGAVwqzMw5N0PHDcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
	b=rC9cwjt/ZJtdpxnoyzJXOQf13AUfcssM6RJ28URkMdx6wV8RbX+Chyo3cKf2xRjR2/ZG
	 LbG4yaaEutRHg3XA7S7Jy3/9nehkG8qJExKMzHgxYESIgCGF+qhPILd9PfAC+ZNKkXZ2G
	 SG+BcX1HOe2JUCY/K+AHzq1sT7ws9eRZVJhM9CkwHFkOArqMAnGXZq5JpoYgWX/sPhzXf
	 L2H1qT0Q6HAz2xKLf7z7Ab4qQSQ9e/Ypb8uCphur/wwPDv8AxI7v8/O+7GbDqPt9FY2SI
	 AlMorwhfY5Uo+1Uhzvu8v0YPftGX7yRM8pSodRNT1V9N8RLlp/n7/DF8NU0Sj8RTwvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMWL8YiI;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910EE606A330
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 18:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910EE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMWL8YiI
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37000e7234bso548071eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990612; x=1794595412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
        b=BMWL8YiI++mvB2+iBIl7SxpDY70MvHgOpCS3VUgI8aa3d4A19vIjQ9kG4X36UKlpIL
         PvPbBpBn6lQN+f1BWsYsMt26DLPA6BydGxvfCR4ilo5BkyPF9Z0iDXCuq+dteIBtWI+k
         O79B8sl/Cr8D/C+BxicSkv4d7j/j1yn4H/HeBW9xXu5XihcfbQISkMEEwUe3P3nZg4sm
         bA/qlesPeqFwbhnunxXRb4ozrQSqAA/oJ2MDMu8c4ydu7BhNutywIXGQdmRk0ON21+U2
         e+q18qTOVblBKlyKvbDof31/hQykNmbNB4sOgA1fgTBx1a1wZDlg2pM+JemOJsruILh1
         SPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990612; x=1794595412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
        b=TJ3q2VSrfL8cl9588S1RmdLkcthJUiF5EO3ZBwEM019wqxnluVTdc504R9R2SzBGeo
         4of6LiW+WoWMr5imFyDUzqibv0qGptKPGtdlBDGHAPF0D1rM94XPewLuvawrIks/RMjA
         r2sQkchasp0tUF/5ZLJ9qsY/L7zkmv4gYWTAeJbNG2NTxVDQ5zWIppafT8g4iuVvKC2q
         +UV2dteAErvqx3xN8ua2FpdLTmn4ZWPY4mBXTVD3MtHJl5pJcTZcKPLBOcq23LSfVlC4
         1j7BJRU92H31yoUacQb9qPB2XxwkFuYtAFaz1LFtDedU/tuS2MYhPqx9A5DCT2qvDXTD
         B2dg==
X-Gm-Message-State: APuU4Z9BkKSNDzTIyMIuOiUWCyvtSug55w7oJ9FyNiphk+QG6Vio0AuH
	OmHQiZueYyZOUXbU+VQsZ5c6iF6f9jFMHGIAOmRFoGS1eyCv0wmf81szR5YmpahP
X-Gm-Gg: AYBFou2icyxtjCTzGwq+CTWseXL6cbfgRDLJgNbn8FVUpptHiIYfLyXayKRgZqhL/SQ
	/tpuDDgXCVPR8bwBU3pXZ7L6Gn24cRmkYmWlzitThQRDAMd1igP3f0xDub4nvq9NUl/0HxtMJeN
	S3BDD0hvH3Ml6ht6nFMdfpyV8SmywAIvlAr9pG006Ee25PlBBVgAKD9Sb5jLyQ8sK0biz+KKUKN
	Ei1WQGAf3yx3qzn1PL0W1EuqEpwrJsOaNIXF4Et7R9Fv6ZFvZRCIe5U6A9vaDDn4rafqcHPX6q+
	n4xVR0FE79TeEeNzPb+TjY9DQ5I+zJkQ8wmZEi6P3NlC2eEOPyFP9/ExFcB7ShBCECy5FPNFhNe
	GNxhSs1Od1Nwxcu1+GWOC5M2J7MWlw4s6dLInqcYI1FYRxaf6YeRAqZpnFOjfudfp5AKPh9gDXV
	pqiwXSCr+qaA55JQLrlGBTw014RxrKTicvP6SmdSh11yFbYp5Ou/rW6edBv8ixiHo31VVGFXb6A
	GctwCceBujSiCpZnh/GkqbRLb3yAzCCzjxDsABTbieOcHBuTLEZCESsSuEUI4mAsFnfLtuaE1+9
	kO6qS6Ft7cgOsgbaJfTdbWQaphyj
X-Received: by 2002:a05:693c:2808:b0:36a:13df:749d with SMTP id 5a478bee46e88-36f76a1cc4bmr3692769eec.24.1793990611603;
        Fri, 06 Nov 2026 10:43:31 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:31 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] remoteproc: qcom: Fix bounds check in adsp_da_to_va()
Date: Sat,  7 Nov 2026 00:13:08 +0530
Message-ID: <20261106184312.100-2-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

offset is calculated as da - adsp->mem_reloc and stored in a
32 bit signed int, while da and adsp->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
adsp->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < adsp->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > adsp->mem_size - offset) so no
intermediate sum can wrap.

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 46d9169a37f6..1bf87cd0e9dd 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,12 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < adsp->mem_reloc)
+		return NULL;
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;
-- 
2.43.0

