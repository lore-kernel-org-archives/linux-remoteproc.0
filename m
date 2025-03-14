Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D0178CF8
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Mar 2025 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940676; cv=none; b=DFgYIGhBAe3mKm2BI0+F3aRdSq7WnZ1nMLEmd5h4O+Y35BLyeR9GfGn0qpfPPpSfRLBZ7WxcaNa2V2T7/LuX4hF6OZ7AaxPJdO83OIcfoYRVg0ue7Bb7LunZk2mrG0YUmMWOHEJ277mfkZNXpXSdDLzNnM5CGimGvQ2w4Vkx5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940676; c=relaxed/simple;
	bh=w97u6BXDdV//+jswswofrPD9VxViQ2Pn0svg6KRTA6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L8x9jAFggZ536yQCY37t5w/Zz66t5PL5cLpLQ3JHbIFkSkyKZUNvfxWyKIGf7bGjL2fpO70i+I0Ppk00+7/JGpzXXQZl4mgftNmBBg4f9IS1iZelZM0LxMorf7YvoJnT19kaY01TU7CYjQ+aXPGOLXPBvSc38BOF6CrWj8mwqxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=urM8dhWs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="urM8dhWs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so260550066b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Mar 2025 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741940674; x=1742545474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ywEbrJtSFC2AqYUcKXRGNHqBvY9/O6csNZBNXCU4/xs=;
        b=urM8dhWs5Y7oLcYQvV6dZx3UhUExNrSuJDeoQJufypl9eYw4jWCypSsOmzdfE83w9Y
         lpftxzCo73kh/iXTa0QDlPDHx3rwnOh8PtKmLcS/t0ygyDNPgBszsxbSUd+twIGcgW0H
         1tKob9Ic/oSHGgI7eedII5ltBV2Qd5BNujIBvLU23BqzGzEia1gDH+s6Hf7aBfDiYRd+
         g1QfojjvqmBE4B66f6BNUu/8pguo/RMd7URx2BkIEwq/Vbq+mudQFGnNrd66WmPBJoDL
         ORKi4Rj2aUtcKcFBBIlnvLJFSNy8b2uj95AS1NpJTcYsI49CKBPvidw/VMhq4l5qqlQi
         o/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940674; x=1742545474;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywEbrJtSFC2AqYUcKXRGNHqBvY9/O6csNZBNXCU4/xs=;
        b=w+jIy/TaKtkDZNkPDTuHjSha8HYI1yTjqdnICds7OgQK8z9bKf2nmmuurg6ZlIx3Tn
         vP8pOgr+phBEQxaOJIjk7ujdyeGnBR4vlOYdLpc4qIPU/MJdDXeavktfH1LcRer4UAi+
         bSdF4wSrLdE+npJh0GP9YesPAZS99bOkcxR8ZHOhxlEmONIok2ubyNshwgnUxynTOjAD
         ZNf+vQPsSeIC61HCSHf7erjs2RQqFZvF2mJWFfgS7UNynHsTpiweDWwVKGhtFwLIiS+t
         KvKEGOwIeBp374L585yKAut0Csdpdof8yW83Zf93ph4ojfTXib8VdjaaVYmdQOfGgaIb
         5QJw==
X-Forwarded-Encrypted: i=1; AJvYcCUfDG5ifxrznHzTKML78fdLus3QCtxR3pF64W70v5mwvCDsJ0wqW3n8Bd1D0MxpDdBW2yFVewbbWvJMmu+GwZ1E@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw282FUhE3+woTmI4iaJ/XtCHaNkKHgCHv1k809qgLX2huErsQ
	uxtYN7amf6xV4EeIC+haPRkGZxh1f6FawmvRBvX2Gdy7h2zRTuGUhQjyLwQjvmc=
X-Gm-Gg: ASbGncsi/d2yA9C494eg9VOzQTYy3nc9f5G1IJvC9DY8jPDuKQ0uVZGEqAPugixXVS+
	5/tnmMX4+mrSvvO+y7kRXtxOdPEcYu6/GHQXuSZpBoGOSHcX/ak2wFvsAzoiD12dU0e/XV16Dii
	AcRQVG71nonG0ImPFEBcbpOhjF2F1pLtSUYaa8PEtWX4vtQjh5xYdT5OJxLOhli06S4AoQh/Iog
	vYlBzNVZ1+1zwAp8+lmm/RKWbkDAWcQuiOQk54zbqKx9fXx6ecDjzTuoqtsvHH5qMeO1loy2F6L
	LGKHH67maH5tPOJzvW3zzmtgligeW4aho39wFGg4GyfD5TfoVpy/mkCIb89y5uADnM0mZKbNZM1
	MF7Wof96Za1IJglgvng==
X-Google-Smtp-Source: AGHT+IGTscR7BYFU80Pa4ZMB91BZEbz1XZF1lYz6b8n9RlCmwKKPrDiAzrx8K9+FPXXto+nTQ+ePIg==
X-Received: by 2002:a17:907:3d8c:b0:ac2:806e:bb51 with SMTP id a640c23a62f3a-ac33017d768mr166849366b.18.1741940673584;
        Fri, 14 Mar 2025 01:24:33 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa6499sm188846866b.183.2025.03.14.01.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:24:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 09:24:31 +0100
Subject: [PATCH] remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sc7280-wpss-minidump-v1-1-d869d53fd432@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAL7n02cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MT3eJkcyMLA93yguJi3dzMvMyU0twCXSMTSxOzxBRjc7NkIyWg1oK
 i1LTMCrCx0bG1tQAU0eCZZgAAAA==
X-Change-ID: 20250314-sc7280-wpss-minidump-24946ad376c2
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the minidump ID to the wpss resources, based on msm-5.4 devicetree.

Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 97c4bdd9222a8d5324fa3655019e2818f4fd95f1..a78d4292a05c70ccc7ad0b46e641ef45253ad8e6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1348,6 +1348,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.crash_reason_smem = 626,
 	.firmware_name = "wpss.mdt",
 	.pas_id = 6,
+	.minidump_id = 4,
 	.auto_boot = false,
 	.proxy_pd_names = (char*[]){
 		"cx",

---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250314-sc7280-wpss-minidump-24946ad376c2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

