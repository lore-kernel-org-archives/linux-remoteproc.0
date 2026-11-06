Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987161;
	b=4QYqQ0i5CE64zw+42o+TIBIQpxnJtWaZHkFpwhVfOczp2t/H4ETxUujnepfZFn3sKHHO
	 NXBk2toYTdhpW88y37xclw7tCzz+Vxa8KUN1N/ZNlgKuEsHy69ZOiVnLFhd4dZX+LP3EM
	 fkTpdtGLtywYFbL0DbEqOND9sd6nuvfdhXPEJdhhwxiPoAXkTKohhZCl3fyTMuoNUQPLq
	 oi8Wots2CqJEmJUX2qwzgYqk8LuLl0PZJfFKYR7wIe5tl4RFAMXw+8PiC1SBDvwhNMlcb
	 RLKZ0MM7rYaEnew7qcQfLmYVJCXyhRo+GoNcyDgyO40OkcykHov0W+agGpSwyo1Q6zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
	b=sYmWaEFJ3URAbdnMg/SCMuC9BRzyyMSHjS5nmgXKbuH03WHvDkvZVBrmLWlYpaz3R5CK
	 F7yn0HFMOuLXIH+mMMAvH7B3vLe9kK5qBVKsjwiq9pPF6GRZZWFUxJDN5OEkN3gOFjByy
	 DA+2iJgGtPjPBh6OUud88dk8MOdHI/XwpuD2Vw81fbK6+vaHTRcZgQ5tqiWkYrYWOJcSs
	 CJ3Cc7Dm7eXq++s1Vl+sNlf5IfJCD3JkKd4LKyfacMAULHbWqMph0SGG//ltp6kO1RCs9
	 j9mDXWKE1s/ZkB1HmAysqxraKKFeD/8bdFTfOyiqXtHyvPA7EW/FBigvhdnZEis51sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk7Qvy5M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpOtDS4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4B8606A326
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 17:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk7Qvy5M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpOtDS4z
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F05s62671820
	for <linux-remoteproc@vger.kernel.org>; Fri, 6 Nov 2026 17:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TrodIbEn58SSppDzbgs2/3
	QWhe/yl/+v+9G/XWM6Yaw=; b=pk7Qvy5M+txPoslyzKS2N23D1S0A/gBi3AU28k
	4DjsT+EwtGTPJ3xqk00yrz++ny5iEP+PbWcBEJn/SDKfXSKJCoUHrCkyWURc1PP3
	zQYd6cRxFeTuah1XDu26jP0kQtl2p0+f/cdO1QX/yeQr+a4fbVtQYG1dRc2PN06l
	gDUGXhJTNgBl+IHU2OBBw0JQYAF3E9HLwghqCFUG7pXcRlYi15OzEKyf9vqBeTun
	3dKXD9hKtGW1AYd1veuoUNQjCq375O9GvobP/LbRIniovYabeeMgcBNsQLLKGnUD
	qBrK6KxuNequ2Py9KqivcS4ka2zW6b+9zYNGvetNdCFy9wZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcbyrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 17:46:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed00709df0so8789565ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793987160; x=1794591960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
        b=DpOtDS4zxS2cL+j00ayxDGwhIVWmDD2mV7xyqobDK89Lg59KuIhf/urmgTTvbW3JCk
         YCo9MRRXnT2/zhSeKUWpMhZuwDe4miYMMQFdgCYqcg49CkhKeMaa+sWA9ahQBrrc8K0F
         2tYwr/KTeZDTzxwj+5crJgsOdnuxb673c4Rc6rGE2BzZvtLIHzm0H1mhZhMeuLW22N8g
         v5nsgtY/zu6OKBat0X/MwqOjApg3lLkFs1ZTI/zPRJSas1sC8DJv7OzZOe8phmDyMnM8
         ClDP50LQ2jVhEJG7TJqJ6iXmAEIZgLAyZ8XG6MS1Z7OcVF+sjPGIiY5CYrH+ishzsUkz
         kRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987160; x=1794591960;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
        b=hnaZf8whRI9bzzHRqzVr3ZWnWaSo9zn6C6F4R5byjFbuzlkwrm7v9keFi+/OtGRPB8
         z06mWihd+ZJPoRYDmXAlvYFcX9RlCQXcBFJlO77F2PnReOkjajkdW70VGFB7t6h7imnw
         Cr7c8qphR/+894iNS7jgPtdAk6hpmfH9Oeyg8Qb3aADbWAMhQvnejMq/vbK2xamg+FlB
         Pg7xSv07649cHWZwD5GTi6Ueoli0R2kmrjCHe1eKkUjwNpk+EIQRfBUhnenXoHV/BQ+F
         X5A5Smak709GfzY93IX7sC37wL1/TN6gHbgk2qdM/J1pjQk33+yX7s5D+cD7tlNh8b0q
         RfJA==
X-Forwarded-Encrypted: i=1; AL+hErEOOb388zb9uxxztJhj5ek/VrRgTqREz4DFKw7hdH+tihOu3xkkOSQEgo1TmT+BZZK06A6Sl4B7xS7UpJtAC9FK@vger.kernel.org
X-Gm-Message-State: APuU4Z+YG3V5s/1hbKY+4nBM8oDPHM16MOW5UqTU2v6tNifnEOYe3LLZ
	kvfNU2HkRbqGSDVdTme0ZvEX2xg0hx84kG8bC56c54lg/J8qyEJJwcRWyRJkt5MMsnCRp/CDPL3
	/6Wc8DSEzz2jup7ZJ4yaHHmyOCX4u37OnAYC9NmKjf1VRvi2M6gxr7XMgBOpJpqosoQFKtAXL
X-Gm-Gg: AYBFou13ievLNJmQpQx3gMrBR/sDY5Sa/SeB5bgmqmidyE3VPP2oC/bxw4ORHFozIJG
	JaggfHDSH2JsX+ICDBAWWAznSYZwKd6ALXcs0Rx/Qm+NICEjgb4Vac9inWcNDVVc51xzWZU13um
	dfoK5j7nU04FyTw9k0IRCV2enWPT0qVVWle0uIzsPj+z/dl8QOe/SJfx3PmBBG6U7O1X8NebeeW
	eCW4erFFDvQSSF+KGPro+4fNigDMv8z67/Vhoomig8qL7udBBD3LYadW/pc2cj3lgKPIjHg0eER
	x35Cm6Q13RE6lJA6pxb7P+ztZp76H8rqP0tdyNgKioP0osio3sAWzLnrTsSFwKXJn/YjNTx1No6
	h/zR+RKAPazfyc0mrZ9mJGDBtf7BRaYWbvkXnKhiGZJB+EX/Ur4km3YDqgA3oeBg2K/mnKIol+u
	dKwJqq+k48w24=
X-Received: by 2002:a17:902:f64d:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2ed40e8e3ffmr36074225ad.62.1793987159821;
        Fri, 06 Nov 2026 09:45:59 -0800 (PST)
X-Received: by 2002:a17:902:f64d:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2ed40e8e3ffmr36073845ad.62.1793987159266;
        Fri, 06 Nov 2026 09:45:59 -0800 (PST)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d40d19sm7745575ad.32.2026.11.06.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:45:58 -0800 (PST)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 23:15:50 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Release OF node references in
 init_mem
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
Message-Id: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE0S7moC/yXMWwqDMBCF4a3IPBtIRIPtVooELyftCN4yVgri3
 o328Ttw/p0EgSH0THYK2Fh4GiNMmlD7qcc3FHfRlOnMGqOtanK12K1wg4ibvAvwotD58qFhSuQ
 1xeccV/7d1Vf1t3ybHu16peg4Tjgcwf93AAAA
X-Change-ID: 20261106-b4-q6v5_mss_of_refs-edf890e18e4a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793987155; l=1666;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=4tVJv4tMHBDkmKDzpNsyFItbWpkgDiyGlM44OHU4nOU=;
 b=MexmNNiGC0gPRwcx1+1QNBevNDqkf1XsI/zBTSXwUVwa4rkR/kkHO+dpwK8IosV/0quiR6Er6
 WUsk3VRaZoZCCy6UaGmCbx76syN2fLk83YB2fNb6rFbb4Xlb5BS5/xF
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: kXOcAqEhNPLuGqKseEmnbSRrj5aFOJfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX/s3LM4L0LUVJ
 en/Y+AFzHNwWPBbziolmHVsjmG0xPxOEHM1wcyzbor2XvFBkXBbUVEj0tUW3xTUp3Tw+BbdIQi0
 inKEjVEYuaAAaFHXqL2DzWuIN2eSEazNE8lTuRpfahOpBh5QJRL9/clPp07GrYtYSYocoE7+l3n
 h+PKtqZ1kMfsTdMnGgLCosNOtOzSULi2gbt3X2tND6buL01H5bRtreg1yxPZ3qfhQEgKLzOnsEe
 lIrNVHRurCJf7FN2uajSALVaSSdzbSGZZXfeQ6OqNbm/diaEqpq8W5HBlqa+WrTOuRQVH5wJucn
 PbjxpRQryETikp6YobMSYDziVYN99ifPJGMXvfy4DTVPnHAgJEy8ga60qX1v8qDiHbEKokCIVTU
 lDYf5sCEyAT0ntBuO/RRR90ulWC2E+1CpVjFF3kq1j1y+ZMLMJH3/FN/koMFpSbrkznzeYZEQ+l
 szfVpbOO3foygVgFVNQ==
X-Proofpoint-GUID: kXOcAqEhNPLuGqKseEmnbSRrj5aFOJfG
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aee1258 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vl1InCOBUffSk_vTzvMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX6euB9o6yprrv
 uTXRZUp71hjMFNaX7ADZOQ+h3XQGGoCabtlknwtUP8bfn+AiXmorWXyY8WmnTjabxlB83L7t2Xe
 GT/8CgLNlZOhdChF1HaPdqn1wT43urM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

q6v5_init_mem() parses the qcom,qaccept-regs and qcom,ext-regs
(index 1) properties with of_parse_phandle_with_fixed_args(), which
takes a reference on the returned device-tree node. The two blocks
copy the integer arguments and never release the node, unlike the
other parse blocks in the function, which call of_node_put() once the
node is no longer needed.

Release the node once the arguments have been copied. The leak
affects SC7280 boards whose device tree sets these properties.

Fixes: c842379d00f1 ("remoteproc: mss: q6v5-mss: Add modem support on SC7280")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..e7ea5e838602 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1846,6 +1846,7 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 		qproc->qaccept_mdm = args.args[0];
 		qproc->qaccept_cx = args.args[1];
 		qproc->qaccept_axi = args.args[2];
+		of_node_put(args.np);
 	}
 
 	if (qproc->has_ext_bhs_reg) {
@@ -1892,6 +1893,7 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 
 		qproc->axim1_clk_off = args.args[0];
 		qproc->crypto_clk_off = args.args[1];
+		of_node_put(args.np);
 	}
 
 	if (qproc->has_spare_reg) {

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-b4-q6v5_mss_of_refs-edf890e18e4a

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

