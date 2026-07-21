Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666B44683C
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633745; cv=none; b=u6PPAaqVnFIVl3mn6t0RPSRXurjx2U34nmx8L7iRnPhQjkLzJfGoeF9EllIH/Yfk5PVyaubqRemb68+Uc6we/RSsy4mRlaCmXFHSZyj3Gs+oMQ/nTQhfRZqQbO2B4wTlisDtTUcjRInrcAwz1HqIKgYaAdcb+x77cv+UVqgx9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633745; c=relaxed/simple;
	bh=oHSZiRy58hrGyuhIhAfgGX2LAvyr69SHfuaHWR5YIag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xow7bu0ZfFGj8B56gQqtxU2mJDHzfCL+Gy4keDS1rjjAo2XzWEhMEIFimH6Vc4rRMnhToFzlSVMeSnSX5d/Vp3+DMjYvDJcFK9dkg2liltpsrYgdMRIeFoKFKlPwGx9rxoUkbCW4ufTJkmssDnzGPh9AUmI9O5NN5egVZxoG0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo3boR+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GA0Mx+jT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo3boR+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GA0Mx+jT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARPZO945933
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0U1z8xffrfW0wfl76uCHvUg03r0bAsknAxKB3FgR4/4=; b=bo3boR+NsfXO9VNB
	baOhJheq9QUNIDWlM4j6PeqRc9yesN6Lqc154W9fK2fOtrnVHykLH1Gio5Ks11Dq
	bAodZ0P5EwDWyAUDp2IYJA/RxGFKzoBDMcIf2K1b6LpPSK60k7SQBYca2JuncKSC
	zWdWzCbI+snz7RqCSKcsr18vGPbnJsWkg4oWKODKfEIV61bJzEzYpwkquY/aDTJI
	5RK2pTLgh5IYsIGhJIVeiydj42SPEsxoPmQ1Art+1UMbh9jG4pXtGiVTS5uB9boe
	AKBI4gmnQDQ+VGjUqF1GV9Nh6HPSOJJ5p/xgKLrTNIXVyeHSugOhf83v4ZMzT3Pk
	DHVItg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es21jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso8767131cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633743; x=1785238543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0U1z8xffrfW0wfl76uCHvUg03r0bAsknAxKB3FgR4/4=;
        b=GA0Mx+jToZw3iXuiAwQiiJWnfpRkWw064rmfla1hIAZLsUhOfWkWuUhEXMiNOr6Hw1
         3zr/A+Wj0TxMnxLWZK2Xh81Y8FLgF+WjO86gdrHj0nuh/RNOZh0bGnksaF3eJwaSbJz/
         7VKCPsH78wBLyCAGBBsVh7iYNPf53P/WRhVx8JVw0TzX0VYf0zs7/bZ+LvFZtmifec2Q
         QS6nFSFHTDsDyAivYhmPG8jlCytP5pY1UQnFilu/LyLcvkrnEyA8iGVGEczzVvnn4Evr
         8vj8G19JhUbzSNrmxxrWuW3S5ECb9ptJK4oBstXufU/URToIgrPQM5yaOEoEcSsqb47q
         6Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633743; x=1785238543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0U1z8xffrfW0wfl76uCHvUg03r0bAsknAxKB3FgR4/4=;
        b=UQZDcY9J2c8MwQpMrJie10L8xJnyQO54DW0Qst6mhjHK0JixlgA3FU7o9AYFRvE0Nf
         0fIsVY394fGpPa1sr+uH2G4DmIP9BQ5ilSLb7WXHiGifLHTnKt0JxnTTIz/s0DtWxoey
         M8CuIGK08UAsrpUCaf2ry3Oy5M2IXxBNORuTIzZfs33zps99Ra2Lkn7ar6Dd6wUT99Q+
         eI1CbU6EoL14TTgftKaO/E3evZs8yqhKAWi5BeJkTMtbI74djZ38IJ0LQaPVHKO5XiuK
         1F8SeCFzEE5qfC59vhFR7ll6uVD9AkcV7ccMSBtGH4DRrrtX2owmEymzmNcS8OyCBvFW
         KNlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhEAqYVytK0KBdJS9nLJacMDQ8jDavzFXZawZzA/SywdoNNLjS8nL387bjcD/z6CBOHZZEm1Sz9Pgpesisb2aP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzru/UZugwYxnrD+OLDxEd1KmSrcIifkYqjwvjVzUGgIYvnEIlB
	T/HXw3KctKx90znm2YngiI+R15iYlsFOxhUqgsXmTUjS9DFRPwB3wV+PE7rtSwWt0PWn1tW40cb
	b6BNtrrn1NJtPSVcjde+52hSwjsB9JHYh3X0mXxpTxRIPSqJIgkw2AXpPc1zO/JPr6Y/eQ7qp
X-Gm-Gg: AfdE7cm6JgAFXWJCyXVnlWOzCLeMisQvfWWLwS3Wptp/1OzJoCSbEh99PsvUcGrcQ6K
	kOGIaQOJc+gbvRJDW3abzQyWO654ITta789W0N5d2AnA045fPEDZP0DOD0B3LQc1tURKdF1kcpk
	f+DCpvlSlJDK3NRPYgkvQyvtOEo1HKqhMRhnOw9e26NR5pYg0YLH7yFiH0EOSxKhcaq6rzw8MNA
	OuSmOY2m89B1bBN5kw4WF6wagan8b8Ah6tM5vDbmBeMAqJnwutDlbhnKdQtxC/UjO1LI7Pjix7S
	nL6lr9vgezRlAkx43E+ftTOpUGgj6G8eTAjxEzMCDxHPZwWmXSw1quvTNv3Q+I4Rpz7aIX76cfY
	TG1zeifzN
X-Received: by 2002:a05:622a:5d2:b0:51c:7b11:41b3 with SMTP id d75a77b69052e-5213f06fc63mr160539101cf.79.1784633742618;
        Tue, 21 Jul 2026 04:35:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5d2:b0:51c:7b11:41b3 with SMTP id d75a77b69052e-5213f06fc63mr160538711cf.79.1784633742051;
        Tue, 21 Jul 2026 04:35:42 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm69798075e9.11.2026.07.21.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:35:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:35:08 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: eliza: Add fallback compatible for
 ADSP remoteproc
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oHSZiRy58hrGyuhIhAfgGX2LAvyr69SHfuaHWR5YIag=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX1mGpHevQgw2HiN6/LKB39lpugumt2fIDtrbZ
 BwUdzLY+auJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal9ZhgAKCRAbX0TJAJUV
 Vv+hD/9VPg+b07HuxjJr0I1cSGGfrSX81Fo/jHq4EJG/WtzSeAypHrEfxWTeInqXiFcCThx4YE+
 hnZXbIOlK4kEvxJ5vvIW8CX61r5uugJCqSeaSq6XisrOSJn9WE4lal/sZqGhkcSJ7vmt3HZcLus
 nA79f2/kehUVXn2m5hZ/os+XX0A+EyjgSZCY9KBOASDBS8wU/AVnzMA4su9UwT4cVE9ACtETDin
 wRwqGt3RjdqF7ZZB9sWmjQJgVYNqzYGcyKttH1FpahBnuz4YEvLpXwqznM4LxjzMnmV2FUQDYnZ
 m7jz2El5mTxgLWL/uXvOJFKvHICIRTZ8UhaYxeLiuu6Pnkd14/3xAJs3KqY3/GI+A3KbbSKTS/9
 otswHENBuaxwMdt2zerwABQeQ9SdcY+mpPY4p2lxJNG19WTNWbdTe/EjHvvSvemY75ylHrb8crw
 zseEpkh+yLF8gzWM+R4cOruclnWR5qV9ywHaBNJzm0CJcrTJXUE9C+k0iuSbJx2yxx4KPDmPgkD
 kT6LrRdAIpkDOKpRMK34lIpWKsD9WIJwGVJ2QMveOs61Am4naTW8AN0fFBDNbiqzHYPTGz9sqzL
 P4epTvmlPcaIaqOCgebHluKVhVAeOJbMOOSf0LC5QDnGL5nTu4Ij34rGYYjE5HrxbC4acqf9Cqo
 0tpY5vjJCWv1yTA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f598f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fQ7osVl2w1AEkLw2_Q4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: mRdqrJIAfYOXxO2BByYWdcBeN28ttWl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfX/rwGfrE0vGnk
 Y9qmp1RGtKmEOhvlNUPChEiLQVC9592xUdAdZNrp9BNDc2h6DTSgnOisUWlBowd5W4O8wds8mfG
 KJ7/ALvp6g4rdHrF5PjdUut5Hrnr6FhrgcyCzQJeU7KrvTDXg6GMp5u7MyKTp/NxHmh2dIWgzJl
 SgfUzgJv07ngsxX6Lrl8/4eeiCYEzCtgRaUV6+Zt6fCPchwcLpes5JGtt7nBlMvhLGVaNDfbx/j
 3u5p5Tl2gDwqTeOdZBOKQPayn+8cTidXyZFpmHFdumpCEXlso34k2o58g1de+70bXLGkyQ4teob
 ZZiIjuc1mXDHlIqKmJQ2jfyptmyRz+fGMonn3Io0LeMMoqrdQK+B/vSwDMfOhDRkpxKZBfYzn9W
 wLRSHZzPexScem+H+zIpRV0/lWfZBE2wvh35iLp5UOlT6ojkrlGlPm5ejSsXJju0xNFYimOnHHw
 8c/kMCkgvXrAq56Tlng==
X-Proofpoint-ORIG-GUID: mRdqrJIAfYOXxO2BByYWdcBeN28ttWl4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfXzoK19uOC0M/7
 bVwdWslTTllukqc5zOhGpkrBWBlanldKvfiHHd6A+NvaKBZ9WHGVxgAPx92NwxIeiXKtQ3jij/n
 yvlV4IRXE3mBdy5lZ6FAcggct7ymTkU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210122

The ADSP found on Eliza SoC is actually fully compatible with the ones
from SM8750 class. So add the SM8550 compatible as fallback, just like
the rest from the SM8750 class SoCs.

Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..5712c094cbb3 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1967,7 +1967,7 @@ tcsr: clock-controller@1fbf000 {
 		};
 
 		remoteproc_adsp: remoteproc@3000000 {
-			compatible = "qcom,eliza-adsp-pas";
+			compatible = "qcom,eliza-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x03000000 0x0 0x10000>;
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,

-- 
2.54.0

