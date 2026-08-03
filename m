Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A243890E8
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754029; cv=none; b=QVLbWq/3rqyQX1hFvAkbWkTe6GGEdiqBD8rh27bUvKc5OYyWuKUxQbvWEMXpJQ0ubyxAuCyDv4oIfvCCYviGstvXV+ghcnmvrqh9+USDVIlh2BGtZVeKHs298lHCgjVvbOFErfu0evAxr4tkRkXaQVMiu7X8Q0h6VAlLQA/4ATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754029; c=relaxed/simple;
	bh=nsN0A4BkRTuXBqErp0cyVWbAemAMavp/V4BWlnV3i0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkG1WWO0oKyJUdiuFvYThOxsC1tel3RKpsgRPo5YYO3itBEqgrwj28KCWn/IGAhx6yH6lY7rrzZALs4WY8ul5tV7yF7fl9ND5d720/zsPyULZSloeW0lgZY5hFm3dI7J7XdtLFhqXu0JypY9ht0K09E9bWZ26+tl2vyaQdp+E3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4KbWRaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig+3aiNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4KbWRaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig+3aiNm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737EbA92210740
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=; b=V4KbWRaQDrV+NVuZ
	mJUFdtnEiixzCqAaGEt1ODH+cwfPWtVNJWkeR8Ys+Eq/9IGvUoPEUq9+JHKDs5Vy
	6y9fLN+s/2KdPDSrwGOuIh97AC+X5qpqYJVxh8DMj5cjaSfx6xejsl35xXQyPAtb
	QeewC4otH4R49remLlUWQb2gLRjwew3JTx2Y087yhfmC/Sfx/qP2QDD1p9QqU5A4
	ucu1uEu3qj0amO+k4hZiBn6TMEgb14VVFbuyUfy5qIIfeHNKEYmIHmppjO2k1Rjw
	RjuyK1AZj2+3jIDSSLIcpj6lwoSDP9Q4GS9EiukLlj9KhWpORqhTYEaE0Km9BMTn
	dySh1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxaabp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:47:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2118365a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754026; x=1786358826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=;
        b=Ig+3aiNmNI2iXdbBPS83KvJZpzCUjL8udxIpKqgWASi5sgGAPdzfg/SM2en0H+Vpe5
         H+zQ/D/MvzpDws/4mqTL44YY+rtjp5pGpBM+FH0ZLh2RtAKMp5l9siw8cY9w7G2cLdeV
         VmSjh/By7AunLjENq/+S9ye6ve2aJ2vu1ocO19GL4uKjfkmJsaBnhPX8tpZopueO0exO
         qlU/+PWCNqsLk521t1PVeu+u22TBHsrZsQyc1k5rXi1+wDqHFUeLV/YrpNOwOAso7JSz
         SQq+nCJ4oFqIWn6I/oJ7cBOuzJAInlONlVGnZ+/PRWWUyO4mCMCUVUAIndXucpnV/fhI
         Qk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754026; x=1786358826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=;
        b=oG/CmqIiYCzli/D7qnyEtTMHNCdbDnlc7th2PJdfkkIndATHmxjdqYAw7CbOHX2Y18
         GWwfszn5dA+U3Jogi4qzL8VsNM/Ioo8wz2JyOOmD7v6bxuOC6V7RjtKJcjyabnomM93d
         DR7Wi2K9F6gppL0AHjDSe4pAQ+AGQX2nYtpwKRUtQvgRCnaaAlZWMehOUpZEi5T7CTjc
         dXhf4Ar/x9zfsvM2ijjI8J4cZz/V1gxdiHHEXO5YlhC0lDNDpGrIA4SGySy+44rRnuyK
         HuBEEEqEmUh1YHV5nL4twjR0xE+QEfpRPoF/9MGFMoXpPQ+yz+nawOGF7VE1A3uQaO1b
         x6PQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHYq4NAeIlkZ4msfN8DuCML2RIwQO0d8GLKQtcwFbH+TIZ/4TJ5wGQLEqaxeQSGgEM6+S5X26RTwFNpj5YCdov@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjAn00JAf2P5udHyFKXIrPQ8mSzP4d6y49j/bbZxWrXglosCV
	MmyMufKKLZM5VfHW88QnTD9v8gkDcQbLq0ptjD4clIr0r/Pjx/+ld8M/RAqMSYrPD7xEoKR9K26
	wGeztFDZebm2GfLYbrOa8xeqSPiuZfCnCECwVXlcUKbzgUW1e58ZMnqqgLyXGoxUU6kXRoG/i
X-Gm-Gg: AR+sD12Kts1PNI/r477Cj4Jsx/aplqGnOUtfWSO1H415XivyWts4Wqjkn+caHO7/Q36
	0s0G+0QPGcL1QtHTN6rTr+wyLF3rqr2U0fwezPAXroyXBxtPK4F2f/a3r05Y+2GW55eiya5BXHm
	k9HFNiOH88rddapEjlcgVGjj9Nz6aIFyiewVc0eCsKdlhREL+sR0kNm29B0IrOqCNOqhk84l8SE
	GbAGz46CbR4ehibEu0b7cGyLWKWlvCWsz3jdS5MclF/dRrM1Ck2q4F0Tu1Wu1ViXsvmE4wyvj0M
	1XbRs2cCWdGOsy7qHBSZmO+qSwRlYbpfAFv/Og1BKs6ZaME/S560+ukprhujKV09EUUy/A+KY+N
	AxhjhJx8RLFtzGhorBNXkd0KU7fVBE63wDqQckO4F+YxR7zhW6WcTUhjeZdY51gnYJYopGz6su4
	AZ9oyPRUICxjWOMx2alv9G8unSKCBpAA==
X-Received: by 2002:a17:90b:1b01:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38fbc4cbaf7mr8455581a91.22.1785754026259;
        Mon, 03 Aug 2026 03:47:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38fbc4cbaf7mr8455555a91.22.1785754025855;
        Mon, 03 Aug 2026 03:47:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:05 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:14 +0530
Subject: [PATCH v14 8/9] arm64: dts: qcom: ipq5332: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-8-a1f87b0b0ad2@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7m-qLjaku8Esr0-SjqDFAy9HowIG4FZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXwNNHTwqoGIuN
 m3zO1li0BVwnAqLdsTIYf15iL7rl4I6GdMhf1nhNi/U/EKbn2l+Ay+VjgkNeB5Hg92bxGt2ix6Y
 FGhdivNz+QOKZahelZVnc7ta7heeOH6YfexHCvzUisEdlJssvBXfuzh/N3L7a7cUrFDUH1BzCnk
 0rW5E9q9lF5IOlsOzn0sCtXr+4XtSLMGzlrNYwfzzpzwGyvEDIb4ZqTDpfS+9efKJSVEJIYCqD2
 NArLtUIDuv6Gx6cEaKWaW+RoPbZ/T8v3Qu4JivqJVAV+fn1B3j+OVlo/CIS0+rv5qpSLDj1wUZc
 rd7wGw5D+PBieGmD8OAr/I3ZAu44MgGEPB80P8CZpLu6fBbq5aTh2+9RjMF+VJa2HV6OzuoSEXc
 fSLHO97doWPu6vpZtsGzAIyKGGrX9Yl1Ho3kJvzhbDsgxClhekHabq9X/MJeIt6f7algRYBjHX7
 ja6WNciGsPCtNh0rwpw==
X-Proofpoint-ORIG-GUID: 7m-qLjaku8Esr0-SjqDFAy9HowIG4FZw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXx+KgRGIlCr9V
 IOjHQGTJCz2JXNoHcdYk5qR945xp+iTA87400HsUtZfLvOjErbOr7ZosJ8JFUUAdwsQfdTs6jKR
 NouXTN2LzoIui2kN0Zy1d7aHeZkIAIk=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a7071ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=16OTYffOprEdp6u1-3gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
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
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 3bbf748f2e5c..9e82afb354d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -55,6 +55,10 @@ &blsp1_uart0 {
 	status = "okay";
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 /*
  * The bootstrap pins for the board select the XO clock frequency that
  * supports 48 MHZ or 96 MHZ. This setting automatically enables the

-- 
2.34.1

