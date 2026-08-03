Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B638DC5D
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754024; cv=none; b=tsb6AK6rScL0r2AA3PNmqMluVb0b4gZ9d5zVdxPm2E+ZFiSBFNbd31g/G0YQe8nZ8yZq98HO2ST33/KZGaKtp0cxef+oJDVEZvNwyURmRr3LvCroEkLmMOLkrZtyGRut4hBlY7t5y/NLK3ImU8CdgF0B0Jx6cRVIwED/3MkwBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754024; c=relaxed/simple;
	bh=pFxxeCj+iwbU5h+W9rpZGeU06N+az0yGHyB+CL5LGEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uk8P4zCje/ePFIom0dOPjy5/eVqTqRuvsAO5pEklM05Aind8dBfwIHAo23zs0W+YcQqJU/i57ImVj+ipgdsfJ1YwC9G49J7TZl/io8Y/EAFO9udo5abTZxNeRygeUYSEETpBDhPaSq5XPHK3RNFpPzjB5LqAKa5H8CGhXDPiaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6FQ/pBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwkDJMRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6FQ/pBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwkDJMRS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737O6VT2211223
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBtfTMX7VzOq1GXCprAhYzUfGXz5v0Kn+0HFtpAFmgg=; b=I6FQ/pBRTkaCR6fZ
	o+AsMy0AfRS8Vz17wxmxnSlTyAJblfRIwt86UcnW8SscdpSPguRD0x5sL1xExpBQ
	1b9K6o6RQMWOY0UqPer6YsZm0ceGPGvEUmtEB+affujvNLuv4ImwgAmc1l/Bkn6H
	7GRVOeAne4ksJ9SzeFFsQ2NKr2kZwJpb+FPo/y371H4KdyGaX6sWWRoPR2YwAG0f
	yZH3PsiuEEdZattWLndfEBas5zbHZdohKzVLzVsimXoWWvXYogljc7nOu5NA5XeC
	eRMcVOdDmC3Ou1dsTo0tIhNvi2hTVYKoyCaa5sfqMZe4zd0syIh/GRWTIUrjKZBk
	qCLiZg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxaabd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:47:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5119119a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754022; x=1786358822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBtfTMX7VzOq1GXCprAhYzUfGXz5v0Kn+0HFtpAFmgg=;
        b=DwkDJMRSxp9XFwafIMJL49xC7QQ+n4inwvjX/Flx+ODcc11w/yxmdZWY6T1f2vLNsH
         0un+wkLtYPHY1JTpMcdFTHGFPUSc9OsGhc5y5o+huT2jGfuhNF+rRfyMxVKMDqzmC94E
         fYyg9vQqDLz+qlXzq6ctFP3F7Zqjs8JywMcMDXlNQ73nHXBjTcUg0dHFno3V1P1GOVeW
         hVgy9LLgMeaFL5nVqeoIbayLsx8cLGZi5DT1zvsHqoqXukn3a/CPMJ58fBZK4XfluJm8
         Rv+Q8D1aTt2e0urQ2bLsxKLR2LB0MQspvyDTSxFB1vCysRW8pJbFzAID51TUWoWq6a5d
         76eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754022; x=1786358822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBtfTMX7VzOq1GXCprAhYzUfGXz5v0Kn+0HFtpAFmgg=;
        b=MJVW3c0/Ko+yagfViq4OTk7u+NwYPoIjiNtSdQARtl4Mh+AN1Q6RuwXew3h4mOv/BW
         PkjSSSS70NmxDQs+lfJSBq/TXSYOIqPYXjDaBWoZyEFHNypJMI4CnK9GN6sAHl8pwQyE
         HOJ2DCl8605vUPwgxy/Ccm/3VXatrZGixjqvJZoGo9oGXw1jWfpaGXpsoXBGUKRuhPyJ
         5Bw9to7IogBPvunrdn5Y5tr4v9jAvhSjntitXPH2rxG9J0d34pu18I7BoczR3b72Uluf
         7TpB4HfBAjnn26RAONZoZLaLuiCfQxtxaCEBy6rBJlCeeequHpDYkCGtVxGtrMJ8aGur
         RnwA==
X-Forwarded-Encrypted: i=1; AHgh+RoFL2eoqO/uqPwhWhCzI+ONohLH0hshxhRE9eN3K8rTJwreeY3oUsYMIB/VrUHQc5mPVQ6VW4Jzv/eBVZ+JUTW2@vger.kernel.org
X-Gm-Message-State: AOJu0YxYVhuTIaaS33ZhdaP1UBTqYzYb8NWbf7J3NzIIDbxkk58Tvbts
	yROpW4XvGcZZ/CQMCsa2tBkqvRcibYILuDI+7VWBIUn4FQXqJyBQwyqYngSuxsdTFdbKqplkbc+
	f7QOwpp2MyLmfEhLzCp9gffES4zocNEF+xCGWZAk3aO7l+Pc2f/QS4+xcTY22FWgu6BQZVk7f
X-Gm-Gg: AR+sD12J04IjIaDQr5KURgfWghhqNQxCqJdaQQ7UdtiV254r/AA+aixRP1qzLhpTeTU
	Ebfe+53K/fCu/YcGMuWtHdy1oPEj/HTv3ZHHPzBO9M0cNzDNY8qArSn9ftMnTWXjmP6wWVCRZbu
	L+ZnxOLcl4W5GTpiETwCorKlK8AYF3qpJiwptRe0OoWafDzase1Xfbi53bJFEVdADvsgcbuFHtW
	SeASLIH7QbnQMQT1AqMgX3SNPU7ato/aXjLZff6DrTKy3uLDnlkLp5sofEDvLKm4+3pDwWn8Cup
	xktyS0ab9VOWI/pdwCLGB6e57kW4E8PqKyr6SgM1IivYbGio62hE/QVl5FPiofpfbMUYSXFQxjN
	/B3x+AWRX8TeALOj1QOuSnhrWKJ0n43U9p0FCliRUwCcJUsWwqoMQV1X5vRP4W93SmCbLsImb2e
	LoVbi28cb3AzOXYkEy+YJuzGI/5t7ntQ==
X-Received: by 2002:a05:6a21:489:b0:3c3:9c95:c0f1 with SMTP id adf61e73a8af0-3c92a7bdc19mr9637790637.41.1785754021986;
        Mon, 03 Aug 2026 03:47:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:489:b0:3c3:9c95:c0f1 with SMTP id adf61e73a8af0-3c92a7bdc19mr9637756637.41.1785754021572;
        Mon, 03 Aug 2026 03:47:01 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:01 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:13 +0530
Subject: [PATCH v14 7/9] arm64: dts: qcom: ipq5018: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-7-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: OM9CUBA_UYVXsOO9r0syfuyuwJYApdqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX/bttyccKnfhu
 sgC3vCz0bO2K1xqQLS57B00PbqwPu9R76fpek20u/m5TvkB5enlomzNuCgfL9DaNsZziWljW23e
 BZH4i9KjqDs4Xq92S/HZTxt9D9NQ4eEl4ietwV6bY3u2tQBG3q31Pr/FvnC40l09kO4If5DsGgA
 Eg4qk0WyTsUQTmXAwssitluwkYx1m1sQeXgtnn/CmuD9TJWl96yrLdkZQrFXQ/9vzd5XJnWZftZ
 K0DD/IdEE2SP2J8wJA95f/q9jLHOXeLe317+Uq9JhUw8I1U/6ybIGp3lzgYsfpVdzKfx7giM9xx
 MOMRU87NfEahj/6RsT69RT3k2vI/hLT6xmIS7vCCuD3ZRmaJgMnPGFr6LgpzDBkUTDUMO3qSlbQ
 5QW1hP01mq1Exbn7BJLLARZBJzTrbCd+NZ4wuYIESlhSW7wmafekp/fMykrO/21Va1tYwaJxBd/
 q4wt2BbAdNW1lPQwAUQ==
X-Proofpoint-ORIG-GUID: OM9CUBA_UYVXsOO9r0syfuyuwJYApdqa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXy7+GRmSypWeD
 LkQKwEp0CVagXXg+bHrfs7o9mBEhUBbTiG6dN8PUfG01oTDe61+AT+vI5LkiTIXjYi4yNDWctDX
 SbitfCgANRuud6S5JejMu00sjZ/fVIM=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a7071a6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aRINabbV50o6nBH12gQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030096

Turn on the q6v5_wcss node.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..ce3970358056 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -46,6 +46,10 @@ &pcie0_port0 {
 	wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 &sdhc_1 {
 	pinctrl-0 = <&sdc_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

