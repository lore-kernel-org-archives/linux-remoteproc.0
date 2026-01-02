Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF733128A7
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Jan 2026 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358117; cv=none; b=oKjFtoN1U0J4K9NyCXK6cY0IgXrlVA9Wu716uYSVmggM0BxqgRm5bZ5Uwbbez4ZsIbevQSqYOriLyg3mtAKDrAXdWjQPPKpBQK9TlGi0UZb4IYXbv3obaf2kKNuE8hQg08BTa0gJk8P8LgyfrLVmNrgsd39QuMcjzK6u2D4zNmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358117; c=relaxed/simple;
	bh=QahWHckkIWS/P48btoPy5/mXnEzZmMEtu+GtZ6JhcPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCTAr1m3e+UinyJpnuH7M473CBTdMDt10jiH0tniHUt08FkDsDHEFotrs4dxfx1Coc6hS2oUdrAO0XjRY2ycDwJRyoFswCkGJzwcMZM82n3TM4YJ1AIkySyTIC4p0JUZIGItPlGaqN+MMoKJQ++i7/6dNxKd8h3ImkYwH++ChUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arGyuKGm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ha35PB/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arGyuKGm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ha35PB/m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwBm784387
	for <linux-remoteproc@vger.kernel.org>; Fri, 2 Jan 2026 12:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cAff9gnFS+d
	OPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=; b=arGyuKGmW9q4VINX3ZhQ/GjdfuE
	ZGLuvDa57qe9W1z0oYoe8mnHnIM6ucOLc/HqS74TODNt6TiBn10ciTBxeo4m4sKR
	Reo1FvhI1pzRiQGFnRs1aVmrUZCr+ZthcKthdAlf4fFl6xHMb4uH2BHL4dFCPlgd
	C54IHjopQhFpBvdX0gIM59AcRnsNDJ9iX31aTpkqr4R6VBQQlt0N7CS7rORCwvE2
	EIQzQg4b0eWkUYOaAY/Uj9QTXf979UGPCciqunc48HUkqrYxSHyYy1/E+aEMI+s+
	XIxi1Bl910ieMWus2NuDGHjnHcTTTu922Pi6l+swCOFFZLadx+dFgFXj2Pw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkdvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 02 Jan 2026 12:48:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a360b8096so323916516d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Jan 2026 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358114; x=1767962914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=;
        b=Ha35PB/mWTv+UrfUsNfTPQ1+e0kERhhHemMz9dO9PNe0OcwBsKwcpQXjNvrpO0C80D
         NTj/R/GEReHkOHe7dwtI8bD123b06MjdurvWxO1RwVsOifIaIpQWdPpaP4xkLts9Zm4+
         Tfh13wjFk+XnVjhHiqeDq3zBIuPrd27TiKVAyP5myKZoA354k+UZVu4W7+BkPa4+1iB4
         MT132IUj9YJnUl3kqg2L1edzsuL/F+J59erBiEHSmlHQsS8gVPPqpuTMttPzoFqFoyup
         vQVpQbEpIsI56mK5vnFZERKmZgme6AkK00NBzImfRalubSthMHCe2z35pHxp+nwzUKBH
         U46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358114; x=1767962914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=;
        b=VCQx8jy8eu/N88mPu0lZDzmeC4uGn9hF1s6ZyyZy05tDAEkoI5fRzLQFEGk1Me1JH/
         zWYHElnjGWPj2NzhCiq1a5h+NsfDzxCNmYAtaZ5D4RMaian/z/xTrJbjfvXAvZk03YAk
         UB3svQU0aZw+nfroroJZSKpnd7fWk+Vod8VxGY/xtxOtdht1QPdmnmbKKnpWbVKAaY6u
         PNoR1153sJMtVylXoJMO2SyDRJhHAqRY1KpL/BJpoH8SaLrdzAeiwCbVjeNv9rbBmuDR
         PQgxmYNlNGrEX4EjTkbqdayh6fucO+mDbHJ/uvVjC44BFn4meWlQIB+9SaShrzn4cAUF
         rIMA==
X-Forwarded-Encrypted: i=1; AJvYcCXJqkcx9wI2VKDcVZaU+bEhlsq1HaPdMfLs0Bt7woMVdSrdg8xAL6RzZdNrVOQg8dOkEFf/c1gSrAnUmohoBXac@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGmn47pj9yJZsmyurrqiOlzfvM5L2Fyh9hstafCev+d32mk70
	IHnHUW0J0jIZro9UzLX8V1kVS1ymzhmXwP+XSLnl+aU5yY6CBbJ6K6FB39Z+ucurSJ2L22HlFF5
	MhxMVwIUKjJONxm6DAveIC1FnC7zrgBzysWqAo8+F0vUbXsmbjdFs5ZnDlTEGslH45WgfVPq2
X-Gm-Gg: AY/fxX7mUndP76uieNtpvt2dtZNDmX5d6jGPAQirrtLUGEB81z6bRRTtowzPmlvJ+X/
	7QA5jiiw0WimlXlP9NCTZDlnXhE0a5EkaL5cZhfElUgFsWJWzNdzymQ0PxXqM7jQ3Hg0qiC/WlF
	0NB2dS03uvvvOZaqZAWNl1JNhQcBcDlhqruM90nH4PoqCuFpuU8auGFcv1RF4xHqyvvwXdjc3eJ
	u/jl5r2IHlBKKNccjOJyogJPcb3lgQGYGcgF1Vp94AgfQrfV4WhwqM4Qs4GcdEmPzbSvSaq5XY7
	INvc24P0lgIh+xfCeLOaU2qgEwYWtmM1gTthgAOQWcnUQ44+Mu0MUn2D0abPDl1PJjO1avMAO3B
	21b4I07Em1A4G4CpB1/rnJNK//w==
X-Received: by 2002:a05:622a:2513:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f4abd05fa6mr593342551cf.28.1767358113811;
        Fri, 02 Jan 2026 04:48:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK2STp8WLJC5Hle+lF4ZdajxaBdRXfQ51qO9YgGmzuFliirENLuJlLIuKhEehVcC03kPN+Jw==
X-Received: by 2002:a05:622a:2513:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f4abd05fa6mr593342361cf.28.1767358113417;
        Fri, 02 Jan 2026 04:48:33 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm802892105e9.13.2026.01.02.04.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] remoteproc: xlnx_r5: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:29 +0100
Message-ID: <20260102124827.64355-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QahWHckkIWS/P48btoPy5/mXnEzZmMEtu+GtZ6JhcPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76ce0/L5LUrLoAxRfFA7ZnpbXrAEmNsseTBa
 iz5XUAWaBeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+nAAKCRDBN2bmhouD
 1yLHD/9mE24y+JYa3Q0sp01pz5zpq8USEciHpgx2fo03B2s4dO+aQPgc2VfsMZ6cxScJFcr8LXO
 ZoS1j1uiyihJBu0YPiwUnP06uS8/1FT9EjX08Kvjixbup6OM1k9P00yWR3caaltKsKL3b4t20h8
 I9akD5xr0sqDFtTMSYfDFHf4xfp0g88GNKdYPYjkIfVF7nOp8KiDPnI2s7CsTuZkd7EEY81tPSi
 g2t6283gz1dLRKjJxIu1ixz9Jv8rEU3uNoPytqETerJCg3Rit4Qq0SGQk6S6fbnczQ6IZhvcABA
 iyS3/mjJ0iG3LMXJnL47viO4/Yc/5dNRcSQaYwvjYjNMgcEPhdEZRr9sRxO565g6gkEfJ++HyI4
 JHhkCyGMCvbWyOwJ+qIO3kZMbj3XGY72OWLUb+zIePvZqVRRDaccrfAjHP9K2U6sujsLTL8NnUL
 zskfoSFb+vt3E/LmyEV/519GXcqpjeS7y4p6J5tu+WMDsTFkWktxNpP4S2NWNXp3EoTfFmQCgvq
 YV2xjBZRHA4PSKIN/cdA9pNO1kL7BiKbvJhEO6cI8J3+vDH/oyssuOaS/jW0Rux69D7ys8JIyvP
 d00iB8RDkBm7lA8UjUzK6Wz6qs8gQX0FfEJMqWjKwQnLw+x/8oVuscZGC8M9hxeo783A8wFYEyW AWIcIZckiZ6u6Fw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957bea2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=A_p-vGNwsLgjMV31XeQA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: juDBsOjCn4vDcL_gye3RPv_ZLoYFK5JD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX081k3i6br8GU
 miu3BL7LhiuFQZfK9YQA5j9lXo1NsE/mb8+9yR8ldZ5GslsHKjXiZp2wPU2mh78iBRHo2EKbP/v
 SWSx4Uok8JhHo71zkmEbw4Ql1U1KF1Xu+LzGY0ZMhf0LFLjKFGXYVoXvv1Lk9fJDvs6frRhh4dQ
 LgmHyIScK3hXNvSQvQXSOwHhoo6wgq/EZ/E4O2KTaAzwBLleObiu7gMYr+wq3U5psnoEsHYm9cg
 T2b7GhIoEg55lq8CDIiHKXbQUY4ma/dJcMI6FzSHNz5SwMvcG8LhKYpWmQIex9I9qR6QVcfeSUn
 9RI/vVxI1zqHCk9D1sJM5MJs953cCiMHbh+An6GZMtT7xJC/qT86K7qa62o2M6d62JtHWbWDoez
 T1S6JycdF3FIDUP24RMIc2hxu8jxUbOofQPQBuSKa/Y5Or1dpbWUf0YaxijekoqpQ5MwAOaq5Xd
 Krv6belU35CiQV29yfg==
X-Proofpoint-GUID: juDBsOjCn4vDcL_gye3RPv_ZLoYFK5JD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index a7b75235f53e..bd619a6c42aa 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1271,7 +1271,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	struct zynqmp_r5_core **r5_cores;
 	enum rpu_oper_mode fw_reg_val;
 	struct device **child_devs;
-	struct device_node *child;
 	enum rpu_tcm_comb tcm_mode;
 	int core_count, ret, i;
 	struct mbox_info *ipi;
@@ -1350,10 +1349,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	}
 
 	i = 0;
-	for_each_available_child_of_node(dev_node, child) {
+	for_each_available_child_of_node_scoped(dev_node, child) {
 		child_pdev = of_find_device_by_node(child);
 		if (!child_pdev) {
-			of_node_put(child);
 			ret = -ENODEV;
 			goto release_r5_cores;
 		}
@@ -1363,7 +1361,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		/* create and add remoteproc instance of type struct rproc */
 		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
 		if (IS_ERR(r5_cores[i])) {
-			of_node_put(child);
 			ret = PTR_ERR(r5_cores[i]);
 			r5_cores[i] = NULL;
 			goto release_r5_cores;
@@ -1383,10 +1380,8 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		 * If two child nodes are available in dts in lockstep mode,
 		 * then ignore second child node.
 		 */
-		if (cluster_mode == LOCKSTEP_MODE) {
-			of_node_put(child);
+		if (cluster_mode == LOCKSTEP_MODE)
 			break;
-		}
 
 		i++;
 	}
-- 
2.51.0

