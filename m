Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F841D90D9
	for <linux-remoteproc@vger.kernel.org>; Sat, 26 Oct 2024 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729980596; cv=none; b=bHUkZ1bTTyPfB6jO61KE3z3urliP+P2F33UeGe5AQilbv9LOxy5XCGng9VMF5YCvxdjJdIl9q8z6P0UWGcu+FUtHt3rN4e7i3kK84wclsGt07eXLkjd4ORqV67wBGXYZVI8s3Inmo7+ThbGbS3HK0mYnbPimSofQhM6lwDx9mZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729980596; c=relaxed/simple;
	bh=b/SCC3EiM435e0SF+1UttQZr5YJz9uE3Qwv16nbZt5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNi/TTSn23A2Ilmd4PB1v66c5Ufk7hyAenE5E/vTM9G+R3AMRLoNE8zyEXN+Zgy3S/Axh2qj4ZIBa7rd1suoQ9VouxTcXmigbEMwlZndzhbkhb3axrbFm2b/Oq9OYOilr/SuVCUdHsoyBgw8AkG6A2sWMjIlTsk+SJi0bWWc2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAk+BQep; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAk+BQep"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539983beb19so3843050e87.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Oct 2024 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729980593; x=1730585393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7v6YRwuRrefYE79G+Igb/nU2W5xW621XF31MIYIYdQ=;
        b=DAk+BQepT45J3a+5H+5YNnaiD6YdgrjYAX4Rs3VNHEUIpj1kdfoXCZWs/QZ1vmU3lR
         u7nuNFkZ/hjvqPcqSK9E7phAmGbb6CbVNq6kgEUR3gbkB/xvziMih0oF6DEX16eawiKU
         Pdvb0vknuLv3llB8610GRPsm7RANzVWGtkoAXqZGC6LzKJiN17K09slm9G7Phj0KY28R
         +qQbvcS++je8fADah4JGHEzIYHgs7CztE7CU7U1QZPeYwO1onebsN9PGHngq4rESnRM4
         VjhlMt4iNRcQQBnkFzxNGhQuVIfbum7KOoxMV4FtAKxRJ80r5jnEwSHdCZOu6UZSfKOh
         B2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729980593; x=1730585393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7v6YRwuRrefYE79G+Igb/nU2W5xW621XF31MIYIYdQ=;
        b=WxyC35uAdvVM/T+CAPM6xRMStsOPI2NIqB+wDRU2vyLVQ3vDGolAQ8zjJjG6bi3GCU
         FDiRsnSbjvlaycPm0d9Q+BYn7G0kUNQ+z3ncvP8FXzwZsrKpepB7JZ1jc3hUs7n6hxaL
         Wn0xNVYe5Ug6KFaT+Z6oQaN6MDk7IHnjKB7arh+40+QIBMB6jkpogaMtL0r98JWm5j+w
         N8fBg2eDw+wv1n5eHqs54bDYVkMBBOk0oBrN7SWJId3SNoV/FCpZn9jwlgGix6dH4Dyl
         +xorxJ5A7ElDdMOZQf4+zgzaoolf0sWy7gLhfORIVQi/qzFp49m5QiyYPmazihQRdswf
         ya6w==
X-Forwarded-Encrypted: i=1; AJvYcCU/3tbOg4YMOgPumzqRcRA0bq6DGYOoFFcY0v7K7TynAjYD6ZTqKjdJkXwyydjvfBESzvyJLDD4Pg5qe6w5Y5ds@vger.kernel.org
X-Gm-Message-State: AOJu0YwtGxF8Nu8Tprb4VxVxZfpTlozoXSrAe2xb6pV3ZkBJQObVrfK/
	3IbdBwsN/Fg5OcpmpytzCVZDQJtwD0OPEPtPid0qWWgNt9NEZAVBo1YwCj08G10zelcXlu99TQ1
	V
X-Google-Smtp-Source: AGHT+IHJCvjRepAXj8M3oG3e7YchG8jJSa07abOm6EBUCbcDOJu8/LvvKfl/RNfygzzmY+RlRu3Ofw==
X-Received: by 2002:a05:6512:b0a:b0:539:8a7d:9fbf with SMTP id 2adb3069b0e04-53b3490ef54mr1608447e87.46.1729980592775;
        Sat, 26 Oct 2024 15:09:52 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1adf35sm615934e87.130.2024.10.26.15.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 15:09:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 01:09:45 +0300
Subject: [PATCH 3/3] remoteproc: qcom: pas: enable SAR2130P audio DSP
 support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-adsp-v1-3-bd204e39d24e@linaro.org>
References: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
In-Reply-To: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b/SCC3EiM435e0SF+1UttQZr5YJz9uE3Qwv16nbZt5c=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHWipV8crRzNTzOpvthCW+iP/SSs/co1jw1WIG
 JQAiwoaIxqJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx1oqQAKCRAU23LtvoBl
 uJFnEACdQKMHHAXvvrwC1/h/HTdxFdOY1GOSIQUSWJb07I2Zb9TVZGUdsD/nBOjhyWZAHwZyT79
 lSXxUCODyxYeyq8LTTkf8FkrRqnoIOlsCWYXCG93Ug6h8ik/DN2sWq77nmcFqaxJ8JHg62UjNLG
 Ljlue/sAH6Lw/DSb+6RHN96k/VH+qwvHdAksCEcv2MN4PGD0mpCX38lRG46XI3nlIl0/8SvRN8u
 usiYSNdbRAApeLPOcGUm9QVkPTViiIE7ioUwMAwMIEAZdh+UyGcGeK3elnpNugpw1QWpsFfSwbF
 Kw0K05V+Ay9NbrJM0xIrVj6eQTbP8XvXRylCkDVC8pxV2ryuCdZ+OaZD/QGx+kiMMkbv3p1tql1
 +bgLiV+RCe23ECLJWx10XxxFSSVYqWlWnMfEVf2Y/aeobA4VEzszfeteItAzyvcgyIz/nyy5uV6
 q0US64zBaFIcAaDE+OhZMzMYbny3d+txjMB2Fkpkc7Vt8RRV4QZDFCC7z7o+MphdDp2iQtvTDZF
 hnFZj6E5J9n1CTy8lJCLe5NHsTiN2QdJPjvWxEogEtHHO71gSbJmbeOOTdsOcU8nRPccvlrc/UL
 6LWccVo9EVLuuNG+q6cXa84Z6yQQfQq3xQbKeaYZeqy9ScpV+DawH+wlUYNQdRjoqaxVqqEh2nO
 QHHsJG/QJePzRCA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable support for the Audio DSP on the Qualcomm SAR2130P platform,
reusing the SM8350 resources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b10b4fc84f14eb40d64b278a339f2ceb45250a62..5944272bc2e414ea2258eb382452a74c1a742d13 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1423,6 +1423,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
 	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
 	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
+	{ .compatible = "qcom,sar2130p-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},

-- 
2.39.5

