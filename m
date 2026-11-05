Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900022;
	b=P+NVlesl0/KVrZwTEpOKNdGEN0NS/T28XEvjjuY6V7NNPh17XypUvpOhNDms2GO1jz4g
	 ZtNqLuFqE7/fa6UtOYfH2NkAJB0ku8Fq1GFvaau4V1XK1J79i5EKvVHQoUacpuGE+F+yl
	 XrX2OJ+fOJvBycnzp2XyFjp4hP7O8+RAGtOyhT1UHCoPpLwiDu+AI2YKZQma6wY4/Ckur
	 qCG5tbP0+R5GF8LwFGZ9tiDhfFey1rPu2c0sOo4CXe6atfAmfqvndJ6B5izN81Tdxya54
	 vyOI6gLdhl74vrmtt1YnsdITgHaxdrsa8/3vuIaQrVwD2jgW3E6LxespzUaMFsCp5Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
	b=YacDmR6z5u4GFH3ecRrnCIxB0K18C/dgrZKCHT3ORZIvu8PSJ4vqXKATdLGnkQM6p4Vf
	 C/HHFTJBmS0Ri1NJMSPTBjo+Ul7JjgrZhIU911GBSykENvZ8UxMEnzCwlZVVkZAFl0WmV
	 MWmE5etNe4BviIpexrIvIOs/gj8Gl+A2NtBi7r/vkz9tsiytQAM17HPEfSOte3MZxq4MH
	 TzY1cmHCIuSo/EmA5BmfDPNrUS4n7RiLrcvOYV4HmQEpZpWgF47E4dwfs4lYPclsTQFu6
	 2r4ECUOBHwo+p0P25BDrj1jCjSerWiVf0rQrp18zIVDuAh2jOOHCJcwwIh95J717hCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyF6YzYk;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C649606A329
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 17:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C649606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyF6YzYk
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5363c8de563so22250641cf.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 09:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900021; x=1794504821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
        b=GyF6YzYkwcfyfHnKibw8IIeooBvfyNHxkcAV1jJMTNU5vjvpnqKowG+uY7aet8ZC56
         bCDc2TnFAVbFHLSslzTWYowdMjW9xyNPrtFSHUJNrfVjj2Bsk3nohMzVdvyKoOYPPbZ5
         fwxFHNggWViaS7BwqCT9siMysvEgTFAEn4DvfwkkQVBZgF/vUg65F4lj6qmojUVRFazq
         uhYeVWakNOtCHxzescl7opm5E84JIE63yBwP4U0mcwPb64hN/pNzEIiT4TULT6rpcnL2
         8VcjlFTJGWMaSO0GV14/qZ3d7w9AaogkU7FRwen8DJg/A3vWBMWTeKi9pM40ixb97G+b
         Vvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900021; x=1794504821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
        b=H9QM8w4XGzFN2OMjwbm1DMLbrqUNNC3vF+ntF2bzKAJianr2ELCTaC3qQATDklRorS
         MjrGS3YLikK/RTdkGDBolPbWrbq54jB47JLAtjY/lTAY1WH1cm90kQI3ZcHJ0TC9y0Nk
         EHLyZLT2M2Qw4S/K6dsZK0UNGzEvd1ycYM09gVjD8Kdy62Em2/BDnxJvi57JHQYYxX1B
         tcfjQYDY+ezd4arBE9apGcod33m+XTrZDWBG2gDP+WFkA19o5Aefz05gehgHxlpeZAVS
         CBBmw122+x1sparO9Nb/aRLD1OKl+ocsKimkraxgFXcHKy/ldkj7uXU3at6lIcnK0Max
         RyFA==
X-Forwarded-Encrypted: i=1; AKwUvBwUsCsuh5aVbCSy6UN0edGMogK+FMGBllofMXermY5l806VR0b+GY9TlO+2lbeN6zBlsQd4KeYkZxIuvRyYNvcX@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Wa8UmSjRquFSBkUw8ILn6xTUbzkvXac6l3ZMOgbXSJL/OizH
	RVIfFMFxeOPbkwLCrq19+WW5zWpXjeYomYHc9elPslANd2IlEPt3mEs/
X-Gm-Gg: AYBFou0qO0nQdf8b34fxF+s/m9XJKSAUEm3D6zyNao27HyC+BnmYTSZkphC893UceXw
	7gG2QKOJsHwEQOIChb4k0ogrXqk0XJKDOEMm1uy0fblCWba2bFx9L6R/aP5yxFjAimQmMtKGwGd
	YGksfXfStW2y+0mRab209QaW8YAuYL3CiqwdZ6zBn1JG8z+IbipnDKg1CHB6qk5AQ4bzm4dYC5s
	0UgSYy6+U5YWJn/Uu7Zg3355+RURfQc2y3/xqg2D9H0I0uRmnXP4fOtunVApKpnUQSbPRpHuiQE
	9824Lo/urEIxzdVpyn1A/oJQWHBfj5fpTxk1A9B+CtgNJdnZsignKgSKLvT9OOoapOj+RVbaKzw
	RA4L9jvoJSqzbWsON8JvXDzrqYDPqT+gnft3Hgjtazm1Y56EVWj1eQgqWBs9zFn83GXjvnsxMBx
	1E/+svgKW5W+4Th4MWEkqbWKZMGeJAvSbycfskZiwUhaHxPL4kDzAQ35Vs4jOHGw8tMm5a2LMbm
	d/xRoYCy7CwwEMnt0aNC+TANk5zt0enVtF5T37C+4IUEDENLX85AO4MkGSjKEilEgMOS64lBcOO
	uMMcTSALEoFbgdoNAl88Ah1E0NkNwVZrLOgxO4QAXGKhYPDKbEd7
X-Received: by 2002:a05:622a:5c8:b0:535:87c3:79e5 with SMTP id d75a77b69052e-542b7141181mr318589391cf.39.1793900021149;
        Thu, 05 Nov 2026 09:33:41 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10ff4bcdsm55937041cf.29.2026.11.05.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:33:40 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] remoteproc: qcom_q6v5_mss: Leak metadata buffer if reclaim fails
Date: Thu,  5 Nov 2026 12:32:24 -0500
Message-ID: <20261105173336.32359-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When the device tree describes no "metadata" memory region,
q6v5_mpss_init_image() allocates the MPSS metadata buffer with
dma_alloc_attrs(), assigns it to the modem and asks the MBA to
authenticate it. It then calls q6v5_xfer_mem_ownership() again to
assign the buffer back to HLOS.

If that second call fails, the buffer is still assigned to the modem,
but the function only warns and then returns the buffer to the DMA
allocator. The pages can then be reused by another part of the kernel
while the modem can still access them.

Leak the buffer in that case instead. The driver has no later point at
which it could retry the reassignment. The MBA and MPSS regions and a
"metadata" region from the device tree are never freed, so this is the
only place where a buffer that failed to be reclaimed goes back to the
allocator.

Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. Compile-tested
only (arm64 defconfig, W=1); I have no Qualcomm board with a modem to
test it on.

 drivers/remoteproc/qcom_q6v5_mss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..1a5afce4e6c1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1128,9 +1128,12 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
 	/* Metadata authentication done, remove modem access */
 	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false,
 					     phys, size);
-	if (xferop_ret)
+	if (xferop_ret) {
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
+		/* The modem may still have access to the buffer, so leak it */
+		goto free_metadata;
+	}
 
 free_dma_attrs:
 	if (!qproc->mdata_phys)

base-commit: 8396089f91fa07dd77b580e045334e670f782ff8
-- 
2.43.0

