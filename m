Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E48518FDAF
	for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379937; cv=none; b=I682k8aBq+/e64NtoM7rHyJqpnT1tEhcsBRuxNytKfhmaQy2yKVonrruk+rShiwtil2+6c9WuIDdIklzqP6L4Md6BX3T6ko+yjMLyIKqBUBZ7Ce1psQxhXaYDk9woKen28dwnIv8c8XXSU/DOUYYOWvN2aD1B5lkw6gghfi+fQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379937; c=relaxed/simple;
	bh=1DBjwwtxbwHCZ5ogS6Re1/jqGYTszurmDpgJz6MaIRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqqYj3kGtJ2GvJSNqrCUB1/G3Yb2QAYNgSi17kdyXg4YbkOc327Z1ZXEYp/Hf023iRp4vm/QvY4EqzscWEmP/5w91gFWpgb3J/fJn0qtOZHbJTSoGg/VuYiS+0IpsJ3ACz802mfYm5GNk5rW4I1uT/N7xs5YLqePwFCk3p0b/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqMIbBQ4; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqMIbBQ4"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c77fc7c11bso1823588a34.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 17:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764379935; x=1764984735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0mYQHmNWcFRHmOFCOrthzYDE4ZUrec2+cQ3emqr7fM=;
        b=SqMIbBQ4TDAYDEx0miNwJi4hkpuMWenZdxDAPwSrGK1IUmlbdtd0KBuFpzFY0dahZV
         MHVaw5tPMD28D3Qjg6DidG2LXXhvqjJXoDNOAwGCRmkBuy8eFmE1VhQpcj2UokLd4IDv
         Iw9+5xSkY61OipCtfFOqRQpzsp3y+UxP5MDUyo5TecoLERHJtLA4a5EhUWnrS62Km2Fy
         SY43v7p/YtNhltnUu0KPH32Tx0nYVnmsU7FD3cI9zrpAvTL6iZpt7ygSLpDQU3wTeu83
         n+EfNW3PCzVm7KbP0sXJmjNwzGFFKxUwRZ0RKwamC013t1tj6tB/FrQA1Cwt6LYSPvjX
         zNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379935; x=1764984735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h0mYQHmNWcFRHmOFCOrthzYDE4ZUrec2+cQ3emqr7fM=;
        b=XB6eBlamO3AQGkzC/XWeZJexE8skdNlQL/xNnyMk4408YYbJ2ROG74/uWmH2lHx/en
         rAyD4jPHupf52nciAlKtBWwhGTwyGofMEnxLR2TQo1LJ8siOc7ni7cZujai4KmscqazU
         G0eUKnCPou0x6WDsCt2PkGbq+MH4YqWMncDfIz00VzvlAjiP9JcH2lOkf7rc2poYLGJC
         hLGVYl+FiQ1tv//giGKNp6GOANBmSGoY37vkeFRhg7Bdqc/jsk1YwuoHg+P1hX9ziOQL
         /iZRMe1NeohTOUa9ZDP/5d5hM0EVh6jYuagCetYMCc4ccvZRsbhYQE6BJVLNypXghldc
         sB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjoL+aSWkSVi4LV/lVttFPCqtwT+mgSbuyE3rOpJN7uyAUvGpRkORylO2Nf/QlqWpa9KF4vc+ELg1/nOxX19EI@vger.kernel.org
X-Gm-Message-State: AOJu0YxcL+CkF8aSWNeQMXidElPdiYEujiHqStCiVyK70VNeUD9Slwal
	f4HbzoI+s33kIjkp5gC1Jm7hwnlN6zBNYYLUdaEHhGj1JEoIlqensqeb
X-Gm-Gg: ASbGncuw+O/0iX3xQNhpGn3hgkxmO2tk/KDZkG5V9eGfoEFxVmDu2L5T+qF2G1VrzP8
	DA83L0+VApLi7k9eug4MqpmUiWbr+cQt5JgRmSchb8zXeesSLKLVkM1wf9dxLVY9Tl6XFGhRpvz
	85sbVVzW1SB8MIZKHp/ZmWzc5YoztdkIYKk3QMEPppsmdV5fP+8QjASj7lSryeCuyKqp2ix/7CR
	6ybjM6NdFc1wZdh0K4v+yr2Rupk0/bbLF7DXHUbYHaZv2u3YpQJAo6sfHh4izCwST/Vl2dFPwn0
	oBZJun+8lkZQifAfCgZHa/rl7qElaXFUY1w3t6+kSoGlBZjDcWu9rPze4F0jo5qkqTosXVToaG4
	9dWv4F48FPzgU6qaBFsBm4pBgcUmOPC4by1qFRB94lGg9mWyNvsn0i55H2PcaLLazuJiFx/wrnJ
	tJlAvKQytzTk//q7X9/PdXikNELqXdj2amZYrorBdIft5+FCLlsPJFZ1pKuP0MB2G4BgDsNsd2R
	7BM/6aYfPPzQ5EgjthP0si1Ue44
X-Google-Smtp-Source: AGHT+IFZhrwi1mgT+oIIEG1mNdR5hmsFiCRjEW+7oGAoAZo453TYTDwuHjWXPV//rP6zKJgiAHoQaw==
X-Received: by 2002:a05:6830:6e23:b0:7c7:5ef4:a52b with SMTP id 46e09a7af769-7c78eafefdamr15136420a34.9.1764379935523;
        Fri, 28 Nov 2025 17:32:15 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fcedce6sm2188742a34.16.2025.11.28.17.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:32:15 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_wcss: use optional reset for wcss_q6_bcr_reset
Date: Fri, 28 Nov 2025 19:32:06 -0600
Message-ID: <20251129013207.3981517-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "wcss_q6_bcr_reset" is not used on IPQ8074, and IPQ6018. Use
devm_reset_control_get_optional_exclusive() for this reset so that
probe() does not fail on platforms where it is not used.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 23ec87827d4f8..6e28744ce3f75 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -811,7 +811,8 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 		}
 	}
 
-	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
+	wcss->wcss_q6_bcr_reset = devm_reset_control_get_optional_exclusive(dev,
+							"wcss_q6_bcr_reset");
 	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
 		return PTR_ERR(wcss->wcss_q6_bcr_reset);
-- 
2.45.1

