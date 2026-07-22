Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD3320CD1
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713270; cv=none; b=LqwC9UQMZ1u/xmmI3SyeoPX5l8zszl2AzSiG3E+Mpo7nyPzY+ftXUlbHkiMakdXb7F9jR6YkeQVhmdoV1yYHPWwi1Gi96ZJuW/90n8xbnZq6Pmdx1z7kELeYW8A23qLMwB//WjAWVj1z7tEA2h2DKoVQkPdkXw4PMMlEQJ9RJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713270; c=relaxed/simple;
	bh=iT9YuFFXjgaBojfRJcbqgLtmmC8ZuRafDSnz64fUB74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SYnRr3vRMsQYaKpKFlHEoNA89lwtnXE8DKkI5b2+oocdzeHi1cqyrSnb7/SaJKDyxvrkEl+ahxIBfKzHTxxVR7jD0UkWFVt3CiHLqjuXu4Sl+wT9hr2kUrKyXUlnQqOPnRMqhLVLJdJf9SBT22jOE4zFD8nGFNrswDeqq5uj2RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHkqKVzw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPyIbPJ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHkqKVzw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPyIbPJ5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x11N523784
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 09:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+TMfjx9N2KUMI8HVE7bQBC
	ezBkzM+oKRVtPJo93ryj0=; b=IHkqKVzwrCryF813z5quh/1DexJ+GNz3Wi5NF6
	lWcTC315/t92nXCRBTaAVEsPEJJMtJkU34taClcVEJ3TDTJkN/DgwTSgqe188THq
	KsnHnnhI1LNa5DYLqv2zZp1Th9HrftveZpXq/PgguGBGeyQJ4i4/NQbgSR6WDimH
	K2sdafiMKl3hK5X/enwEJY2ozOT9VpdDkYqzzQLIaotupZJw/ljee7IFKK+XxZVF
	ev0dt8yLRf/06MfvmEa1PTVLb4keUo/Ewxn8cZ8dLI+VVY4euzhpj+1nN4jxLils
	1Z5dUZobpFdbcFSkfJmpDAHwyh/HtHw3rroLkhg5PEzlTJ7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt0ra1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 09:41:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso100483371cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713267; x=1785318067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+TMfjx9N2KUMI8HVE7bQBCezBkzM+oKRVtPJo93ryj0=;
        b=UPyIbPJ5QlDefTb5XRLvuc6HI9IwCB9uuz632RQSiio7P4Gy6phu21ll6yqIRvMjZZ
         NAA/FXpGV5d6e6eVAhiXvJV3L3F1nuzWUS6qt+Njc1WpDC9iX+1GVRTdttQaMFgYnHHk
         FS9hQ0edGmc6of39kx954IQpwqWmhrxVvRXsKZ3Fi0ygq0RPPWXPbJe+iPneGQtKcjVX
         D66WNS6CbQia6dbTM/2if8ph3KJkdVZmUItez4v9DtVqhtaRkDueCm+JRFgisD9qgoAS
         AZvaGD8l3RiyxzjVEufeo0FgqL5P0Q8wBrD6248AT5C1IoHD9+1fzixzsCnMjPIgSZAa
         PTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713267; x=1785318067;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+TMfjx9N2KUMI8HVE7bQBCezBkzM+oKRVtPJo93ryj0=;
        b=UvXNWlfr1G/EfNXiWnphFP8MejGe3SGkv40CtsRT45QLjIc0JzYmHvR1azqjGGbdCU
         roDRP4JGddGglAjmz7h34+0fW+sM64GKgrlO2xPHLAxE+kaeLUMlQU1ypgvla4awWLMF
         WlqztktAeBbZ0CvBNiBjo9OjoN45eGaLRV+EkWtNcVlL2+rbuliC/6qSEgO3IgjUaR3l
         J1Xw8r04hyjYr/xvEdONsV/MAq6eDEnikvW9PDzfkLPvN4w9eA0Fo3rW6kNKcioIXZXY
         pwZGBL8lVjFA6WPad/43ntpG9PS2VX7Cb5wBAHWS5Smxc238A6GZyq671ez+NcgJRXXW
         5frA==
X-Forwarded-Encrypted: i=1; AHgh+RrbeQfeivUHztRhlznoTlFSJEWyx9AVSWt6nkExA0fOzU1iXpcXql1C2J/L7lQPFLYc418vOwjFgmvW3jm5WEA7@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCg9Ah/qhnynQTlENtTHmlsdxM7dnZfXZnp9med80CDafeyv6
	oH5/aWAu9SYOWKRa/woTI7NOocoovau9gbwBklwrNQ044LTIlipD2jCKY/oSmQSYOlUTku9/nQE
	s/m7k7Kwv5uq/GiQjQBksM0keuTL2rXgYVGSCq6tGoeL+4xtSgf6Ca8vn7CS+7rEClTs4cOGa
X-Gm-Gg: AR+sD13OPKiandmo7+XfPe8Q1uGh7wg43oabg1Zg+UPvUSK07G/0ZRY8sq8K8XeaQ4G
	9+EhsOMiN2MHQzHbj9AVSj4tiyEEKhyo3Dim26lV8p/780oE6ktpeTWRAJNA+rz00Z4J/RrMSEt
	FPPiq4623SxMeVgCpDgTe4v21DsJ1hYkWhonMDbnkIOS7OFzLACqOEfXRWsDQcB2txMLQucnJqL
	I7oEprnMX8F4avmxiyAJROa5eMbI7tn+miaCuCO3GXkm+RViNm7SAYFezA+m/f4D3kPgQ4FdXZd
	9zlRl+f6NnSSsPAuTvRw7WNl298JOTwbxJo1l7gHLedrKre2nbie/iOFrsTVkWmiF1LOfg2i9iq
	RjCCFJost
X-Received: by 2002:a05:622a:2616:b0:51c:10aa:9ba with SMTP id d75a77b69052e-5213e48b0d0mr199588731cf.46.1784713267045;
        Wed, 22 Jul 2026 02:41:07 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:51c:10aa:9ba with SMTP id d75a77b69052e-5213e48b0d0mr199588441cf.46.1784713266353;
        Wed, 22 Jul 2026 02:41:06 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm4816398f8f.25.2026.07.22.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:41:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] dt-bindings: remoteproc: qcom,milos-pas: Fix ADSP
 bindings
Date: Wed, 22 Jul 2026 12:40:51 +0300
Message-Id: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOQYGoC/42OTQqDMBCFryJZdySJ0EBXvUdxkT91iiaaUWkr3
 r3RXqCbgQ++995sjHxCT+xWbCz5FQljyCAvBbOdDq0HdJmZ5PLKlRTgZoLJxgF8jx8NDb5AOxr
 BYHAYWjBKCamzbSRnuWVMPjvnwqP+MS3m6e181B5GhzTH9D5fWMXh/b+2CuBQaW54pRvprbpHo
 nJadJ9DQ5kPq/d9/wJYu6Rv5wAAAA==
X-Change-ID: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iT9YuFFXjgaBojfRJcbqgLtmmC8ZuRafDSnz64fUB74=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYJAptOAuhCY4+JV213h4O5A0u94/AYytZh+WB
 PHETQiTW4CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCQKQAKCRAbX0TJAJUV
 Vs//D/9EaPYbyhtgif2Xi7VYM2eVwslnWgzk6EMTjPWXKvCR0Ru1U8jn/HUANry4e9YFcBEcapB
 dynAmEzY+rdeVfdS1mzei0If43dxcAg8khYu9IIga1H1irYIJV5aRmq53fNPDEUEoLxc8p14XE3
 uM7v73PB+C58iFH6MRaz9Afv8VGky+LsMZAXHL1TwEGESx/SA4JEWNWRssc/jkyrhG/Ccyu1u/U
 F+GIaBUb6eF4d8qkEuxeD2bN4kyntW3orvAoDN6IOUtzPZ2bxrUg9XsBdVaYVgF0V8b2bdmDTA8
 bRRR36dMGDV9IwSFta2LrYvdyWaNkjgvLmyHQXVvr1DmJbPWVfTYkSGus8dHqngGABoPYBz/N2N
 v/6wn2wLigvsdvXqh22utTFyXIdXwclQbBuoBsByD5lnU26GDerVkohdMpcVS3PrM4BS+Eilbk5
 QYBvl43B8R6tQ3Op2SqmeGABJZtXIWXL1OETHKZhq9xauwIR8ff9KEnrRqKZd/gfcj9NckSjwBe
 NAl427ryIa7b281Fr5Wc9dL7AOmCWhOwLcDh33yXOF+2hySVN3+a7nm1azXHx20qcsHlmHHlHfM
 1hzWB+vK1pzq1BcsNKqCE7d4Mv1pOMlQ76J6zuRgQAqnJX2wS3pFfLKB1KNkHNz7XlWAbGyHKq/
 jgSofwDYrSoa7lg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: VIVhcv0HW9sb2KOAmZCUF6Dh4yucf8OL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfXxjEHqEibYtZQ
 pg4v9O7f0RZvcIwgmkZqYodKkEgg3fvXnr0WunY1/I8d2xaJvJ/RG3/i/kYCBGD7T7OaEO1IwVN
 l8LKNBvmqE91M7zyJnsUl8bW0Zv2F6bWGXJUUckqbDilYOnZMAk/1vgIdvkAPG7xuMLVda032oD
 pePfQ+F0qt0Wbf+rIexsDDhovj/XCS0g2Rbw83QRxHXdCHq9IOKp285s60ErdR/A8Yyvvpndk5B
 NPZT9k6IMkua3SstiXVQxnwCP06NJScSD7AvYLt0HkiswfhuvVzacs+xQHoHtdISfPfN3HIVbGv
 H/DqlCXTxz891k1ypDGQXfp4SAPgluA1muWxbHCtnPYgaJO578VShZysHczKw6mnasFtilgcNwj
 AKkzUSJwwyn+2cS9axpzCw8a/LpblfgawbLU2T6XfYUomcKoxms5NlDjCTw5s175r5eYY7ZLQEt
 vxFq4KlbtKx6EEmAVMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfXyYGx/kfSLIrC
 NNQVmlYjEfFuouaPlpyOktM6q2qI6mieBQwXoEveMGDxZW/mncFZQhUzv7R8MH+WlQm3DjlZa3Y
 BYswFW69Hfk+/iY4dFxsz21t+WOVDP8=
X-Proofpoint-GUID: VIVhcv0HW9sb2KOAmZCUF6Dh4yucf8OL
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a609034 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=mTG7cVE9mWrA2Tac5S4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220090

It has been pointed out [1] that, since the ADSP found on Eliza is
compatible with the ones from SM8750 class, they should be documented
in the SM8550 schema.

So move the compatible from Milos schema to the SM8550 one and then add
the fallback compatible to the node in the Eliza SoC DTSI.

This will also now be in line with the SM8550 driver match data which is
tied to the Eliza ADSP compatible in the driver.

[1] https://lore.kernel.org/all/20260721-benevolent-wonderful-kakapo-ca8c2c@quoll/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260721.
- Dropped the hunk for power-domains if clause, as Krzysztof suggested.
- Picked Krzysztof's and Dmitry's R-b tags for the devicetree patch.
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
      arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 2 ++
 arch/arm64/boot/dts/qcom/eliza.dtsi                               | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

