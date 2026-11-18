Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016279;
	b=dVFzJjSJfKwwNXFhEdr3mHWo/Als7WYlXXqfbvaEYYOABperH4yNqdOiav5F1+DrElWI
	 0ZWVpTNdf51mFvSlewYHm2KRuWH9Ne3GOLUtMIV2wlQ/oU97d/grUT8I3e/oMQpron02M
	 ZdvtyFHJj2QdjeNiOzFBZfn9OWpPYy5i/URRsylfycSNynGo7M9vW2W6kkImOHiqCXig6
	 X3s+6gIlGePVMQCQ1VNRNkvykToO0iXhWr58YsTP/iA4Va7YoJ5Va4eslg/05mNx2Pb6x
	 4A6eV+4ceoTmxTBFY+wFqRKW3y684YDXySki1QW6a8pZbXKt7LMlGztxT5mc9UaYpNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
	b=0bl2jxyqOE2O5EHwTqwkBpvyIsGleY7O0qGfWr7SDpVO3YTrRuojUNg+UmJle0xkUpV7
	 8jnd4VX2AFq2LIYOlQzoP/u0LRre0Vn8HiYivaaRf2q+RMekHSYlxH9l42gTTknRbJP/T
	 bJ2meSlHTJ2O8sRJ02kxuk86N45aAr1iFUTQFXelWFP1D10BbG7SGAXrn0vzMxJc3Yqtc
	 XKHhiqE+RwsfqA/hOPmOCyddJx3bDfUaRhk60FYF0qDi+FyyjTDXL9PHQQ7gKtk7JAPn/
	 FTcT+X/vhfIuqBtsnlkfaSUVXYYj3BTXBgNvxV7VST+RqYodngQEg5dRfM0hTkjyJww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CB2anaPO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4771660A3827
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4771660A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CB2anaPO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEqRoB072477
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=; b=nsgyjhGtawXQfqSQ
	uRW3wApuuD+4jPLNC5PmxvPAbkA1HEcQT362Aul+2pAnK+gtANEH+p34LuxvxHL+
	6y2zOGEO2dd8M3itwIUm2mKhyyEBiYz5OkVMpHoY2HseWxNzIckEfgxoO62LOb2V
	Fdra3Ifjwn0J7f2F8F7a6Jbqi8OLb2nDg0D2b7KzWOTlQiesNRRuyJCfOpzz9vH8
	3HPhLIdHGrYuK+YJJ8g8ffCYJOW6TXQc2ZKRuUwxr4llENlzqhK/mY4ZLeHcrCUI
	YAxOho+GDxXwFAoTw63dh5tfctfk/2ui5AUZEc7o79nlVzd9fp8Z693mBcJqSS9F
	onnreQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qr6rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210ce8dfc0so15415286d6.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016274; x=1795621074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=CB2anaPOl7mK/Uxx/NyAKF2ubX79GrVEM25AGkSto2ugNCvviLRU7cWEcrFa2AvyWq
         ylRxo2wAzqGQ1QKm3RxK/gcbsqtkRYHQ/PU77lVDh0mm63+fzxOefwPa8aruw9u/sAL9
         VCByh/SRZ1EXizO3ftQr9kBj5c4XZhenx9NyfSu35ajjx85Drya07Tnlzfue1xI2bYVh
         OEJt/hnktuL7ntvDsl9jTFwA0KWgulKGVzbZmWbio7Bdwk76mMH6o25nlxX3xy2zoPVv
         kPGZOPvVyihRkWmUEdcBHT3mkCrLraBS8yxc8TGVqUlVAf/jf2eUFYCBa/lLUfEogfez
         3ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016274; x=1795621074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=h8FXuiSjKY7EeVcXoh7Mt0TVdlZi+uXvH5/Nv3xySMoV7MwJnQ++O607F6KxYeIGQr
         //yPFtD2peR6jhiqJkOZUp6UlGoyh9ycvI91DHv8L5vCOvnuyS8JY0tLjI+b61abmP3p
         odOwmJPYxByvkOSXkfuPwORcq4a3NheaAcFlkQp2xhx75MdK3L9hYBL5yvRmaKKyRZny
         n3jrbIHRFoJNOo0WcEkYBpM0TPfpPEi/0D4LeZLVcFBPbGbhjjRrpbRl9F2YFLKvuNJB
         e3pg9c0aaurtfriIRBjAt2ph+gVp2fJ3BUmXC0QArrcR+aMSOLozUgWr+fQbCZJnvUJX
         IL0w==
X-Forwarded-Encrypted: i=1; AL+hErGZ8rQJiE1h7cRMrGmDjYmcjsYunFAWiM77s+sxqfPX3Tvmu2FovK4BYB3Nh/m2C42wXdg8rgOI4VT4cGiUgje4@vger.kernel.org
X-Gm-Message-State: APuU4Z8MW3UbTUeTvdJTx4NClW3GieB4pTVrsjnr8WSshemuDY7XYi5J
	GprAR1TzyRjtiNGp7NLbirOxBv/rbGv++enWVWZTZycE/IBzoEzWQ+qdDnpq51TZJQVF3iY/B0K
	Dk9dX6DEyoqnYuQmSdPjdEJwdVcSAzxJwE1ozneJEb3dfGaEqVmVBQb4oJz65VeJNQ2lpnqgU
X-Gm-Gg: AZFdTZdjU3DVkSIyO3QbOu8vFKcc07b//IaCVJV3SBdiKO8i//pp9W1MrngkbFzRiAJ
	LI16fXOr0+j3xqIYKY5yb7e4kL1KZ7Lj8WpDt6XS6U9W6O9si7H4sECiaKa8Bx0ZQtZWxIZMieQ
	xeb2MFUhnGCLCRvPWA3xipFmqx8lxQfDXna+LwshrecGNxOXfFeQr2DfRZpQ8rGi3TgM/Piyf8j
	/hJEZjnl05UVp+b/SdzVqY0qjhok/lEYphxhuZ9ZUYC8AkP9XQGOQff1k3JPZ0iItdUIK0nd+lF
	eehDwRk9a0LTRt6PYTvkiEKXmMtUP05vCr0x+IAYZtzPxkOX11XBN5y2itF9HFkakynw/fN4mR4
	j6svX+GMmMGOwXYmq0Tz+S1JNvDuk2fj9D5Lc7k7a7VyBbcyrZghr76z/iBUTTTOSa9tMDrHn9H
	ioMVVUKgoyMn/PoHK+5mP1M2q+l3tbvrhnRkD/XFCcdpkwgU7XOjR6rdq+HCe3
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714956d6.33.1795016274435;
        Wed, 18 Nov 2026 07:37:54 -0800 (PST)
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714526d6.33.1795016273763;
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:45 +0530
Subject: [PATCH v3 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-oob-support-glymur-v3-4-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=2115;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=h1HpQR5ft0SmfNIj7EEF/Ykdj6Ugo2udF2gXOOZSwLE=;
 b=4LJ4JoCJ5vF0dlcaZOh6pc1mBEyyFDEK3gN1kjiaE9mFiz2etIWuN4fPCr3ld2PwU1GUj7X+j
 Q3BLr42J80CCUnuDE0UQZ4rdnIO4g0RZFFdRUxx+lNDdrgKDFmD1+CA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: VCXw4GCRVoUBrVvFJUphzPMEVNT95OUT
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afdc653 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXyKCuJ49ikopN
 yKEQdqK7HuaBrMfqgAXtgW3ucJWywDFoCKdi981fQp5YTpyP9TCibaU4VBVwzSp/fKKfDBQyNKl
 WZU685NQSWfJ+Mcy/AGUCyS394jPXmg=
X-Proofpoint-GUID: VCXw4GCRVoUBrVvFJUphzPMEVNT95OUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX9oA7iOM/RvrE
 M+NVf7lI4cg7gM/IEAqUYhCx1wtEKQ8mJ9b/K4DUXqSpodk2uTMzKNAON+ttK5rRC0QzN/UiAhW
 cHE03mkL4lWchGeKmW+sdelN0aoisTCTG2DjxLWgO+OxOs737Kl5DKUk6NJrk/RQ9y31BlHOjbG
 emOV1Ww0AuhL7O66IhneQGA5q0OWJjWqms3s6LLEH6gDr4K5tw0lDMzcfoGF116PIutoPzlccJv
 78Pi1TsOlCAWoXlM2rNuiG7dbW2iIGseHIqzx6exZXSR+thoNOnzXUMVPkVRfIgs6SNL2l60V2Z
 u67ixnL1qTzsFmA7Bavd8ieHaFDQO63K4k7scSfef6NvGdPhqIMfYs8GB3LqQ1+jqnzqfBqGaPi
 pJGM7WJYFXPzrBcURIxTo0qaed81agb38jyERhgAp+b7zQWLk3lK44s6tjG55iz3ZYtHV2qg4nb
 q3tDzBCIxiKrKP6t8BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a167bd6072c9..5cc529e2923c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2182,6 +2182,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data glymur_soccp_resource = {
 	.crash_reason_smem = 656,
 	.firmware_name = "soccp.mbn",
@@ -2255,6 +2279,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },

-- 
2.34.1

