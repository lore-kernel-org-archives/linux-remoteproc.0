Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743733DBD6D
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 19:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652265; cv=none; b=aeM7GJexM9i4mtEXeeIlKUpw0wYvzjYydzpiRdxG8GJgy0bBWKctwAWEpwooYamztQLCYo1nYjFdzdBfmu+TNajjewSHwcYtvm3BwYMYIIAj6/XKjeiT/3pXdRvzM8HjPlF+rHkO4wq844nYsKoYS3+F6Gm8DKTxCuLLVvshqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652265; c=relaxed/simple;
	bh=eTpf8Vsj1twgoqcMO4yuaGpGo1vNlv+UQm9PaoC/e+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcu0s80Ze6j/Hfj0bttit+wmchS8FCX9X61Vw4cJoQjBWwf/hU0wdTnHK94Ql4y0Zcinga7BjxK9rOy6V8OucnfZps/bUh58rwSMbwyrtgttLw54SOJZLtVwfBq832pjum78uPsUTlN6lSCxmPXWailw7ADHFeloOPn83kZoNw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEp3LPr/; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEp3LPr/"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-679f6f0855bso4325750eaf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 11:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652263; x=1773257063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKd1ZgsaUe4wWSBNNBKtsv2kKFvW/83dcciLxcaj/4Q=;
        b=SEp3LPr/aPxtpwZtmz1By2CPLWQ00u6N41cEprzFIOh7G4weTMissZdv5INkTKU5h+
         FkIe1s4fXPLY/hqVvAC6WEt2AvHhtm2owKv/20sBZWuG1iaWpiGwSDFXjA/TSwI4asdo
         ZpJUTHopoKHPMsE/78gbZ2kztoldTm54/S5xJ0UdTXidf0f/OEcSlqdclL0oOOdfhRfc
         nl2y60m3OJBGvbQ4SHiWoUh34NqaUPpJ/j40J7RNcLJyKe7TNoppK5ThLhndpDARK7Jy
         oUNawud9+rZUySEbNo7ABV00izn2VrsrccTuaP+tVMI3d35cv05yfsXdfC1BYElbUsQ5
         Lieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652263; x=1773257063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKd1ZgsaUe4wWSBNNBKtsv2kKFvW/83dcciLxcaj/4Q=;
        b=VLw+c3qYO67W2O1EoRxajUujoDcb/ckXXPtUeH7cPBrUGv4TDQwfhERuwURJmXQ9t8
         6v281aUjTsHJRw9O006a1XMm24lTe1pB61u3UnCEfsqVtfa1vfjv06IYgAhT510+ENMK
         oFc5fiYKyUVzMl7vMaIXnsh3swKnJQwyhv/RrINsD49qz47R14oYs/Unb5FC7FxzGLiV
         xdcGt1sV792PKW4y5LY+RZCG6C30Z3WL7f2JkxKfmCQwnaOZXLHuTioj+FvomZV2jO1/
         R1gY0adTLnY7bJ9Uja1dBXLQXMG8rgaJ1DrlvhUrsKurxDWCxzI7r2fogx57QRrZ10MK
         RefQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVUkX0XwANeLTzAjVvCM4rrrKC3Cl5o0HDInKFDkcChKGa4R09d2GyJ4Y+kUktFBCVbFi7atQTdU6XuYLeAAMV@vger.kernel.org
X-Gm-Message-State: AOJu0YyHUE8P0xwZ/FhhNXj9ZbNX5kIvJefq9o6gag0Q5YBgsn2HbuSy
	bLdVxy4pvvgj27LJRStx/IWYteDCtGGBjqjVMx3QxFCil2D1VRLXEP5t9i8I+2zcMdo=
X-Gm-Gg: ATEYQzxpNr4VtcjCew3HFaH0NYcSV2z6PPLdf2HyINr0ynbo4fvIUqH16A7v6NMZ69j
	KfXvc4qF/gxxA9XDHYaSQZZ4RgxMpO9Lium0pa97+S6/oEiTA5dn9fIVFrSacDN92GYYheF4OiI
	tSNjKa02hsrac/VSRUBMOIlYz9QXf9FoVCorrCkKsxnl+5/noxr1bOtqbyl7cAh1Wb0pKpG4rbT
	oFYLdFHMKJenS9W+ZvS1RdTC3XZ+CCk1yhjqVPmTuM3loHMM301s7uUZQZqN87H37U9bdslJUYr
	bkPdrxwcs7ES32XxxJt2lRWJbRs2rJpHBy4/15XpIpAdUZvwSAlIk3ajzj5zbD4Di3/CZguP20r
	ewZMCm3fTFDTiGO3gSKoug5WMbm9c1JMTioncDWXYduCQnhO+R+e+q6FhNSrnlagkBBy/k82/xm
	xBL88fBNtYEJeU1FYVGDO4u9tltNyNil5+FiE4QL7FlEMdXNs/I6bi+eoWwDskCucU36nJix6ln
	tAKOqQ6FsiunhSYSFRgTWlR0nPfIBHuPOxU8gq0GA==
X-Received: by 2002:a05:6820:f06:b0:679:e750:6c10 with SMTP id 006d021491bc7-67b176f173emr1909516eaf.24.1772652263389;
        Wed, 04 Mar 2026 11:24:23 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:5b2b:e942:c11b:ed62])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d85297sm13294165eaf.11.2026.03.04.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:23 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH 2/3] remoteproc: qcom_wcnss_iris: add support for WCN3610
Date: Wed,  4 Mar 2026 13:24:08 -0600
Message-ID: <20260304192409.927562-2-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304192409.927562-1-kerigancreighton@gmail.com>
References: <20260304192409.927562-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a qcom,wcn3610 compatible string.
The WCN3610 shares the same register configuration as the
WCN3620, so its configuration is being reused.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 2b89b4db6c..e58b59355f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -95,6 +95,7 @@ void qcom_iris_disable(struct qcom_iris *iris)
 }
 
 static const struct of_device_id iris_of_match[] = {
+	{ .compatible = "qcom,wcn3610", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
 	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
-- 
2.53.0

