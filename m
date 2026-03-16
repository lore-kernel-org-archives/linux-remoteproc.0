Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08A6355F41
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664095; cv=none; b=pVZb0bcKR2MXcHEhlzpjWX2XtdVUAQd5PI90TfArEmltIgZbYE8qV2W01gGtsA6uB0Djdhz8lXh+uGJmZQ9w3TlKuJ88vSLOHlRenu6TE0FyZjAFy4Otd8h8S9Sa+Jb1hfsarkzdgWNb+BnHNcc05XA1YFNwYXQLuIdyJqCkkLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664095; c=relaxed/simple;
	bh=jdgPOEenPrH+BnN3qahgu+WWKGOOmeDRTpXHshbPST4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YrGWjQOCoeakuYF1L8d/n5VIec2mQ0O3Nc0fk3hxZhrOh1mJvOBETF4m5eW2elRt5CjJjxLnXL0D94plsL0wQwjxmV/fZ2qIKRBhcg3xwJQV52X8g6nzpxPX8Qm9EiLHPv2+REW9PNeHHubSkVjTUR22dvBFrWdhsWSk+UV92xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHAyRGOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4VawkFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHAyRGOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4VawkFb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GC0d5g1724882
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 12:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mlNTVkadnpS2g8Cs4zpmNH
	W17FU6Ww633NSchLqv76Q=; b=UHAyRGOx9nbwh5rp/EBjj4mgsT/XhWGVPCjr5P
	Fh6QmDdJL9AsqdSFM2/ublRDFf42dUhwWQeNFrmKpbDArO7unY8R4kve1ZgkoQuv
	tUkmReYNJ4+Jf4HhEgjAJP1Z6LX9rgjHlZxUZ6BLkwZeZIlbG/palyimJqCkf/aw
	Px7U/s1Ha2PLXlk8z79p4gIqEU4jVf6OowGALZ65xEZI3iYj8cOb3Cqiu/6iDQ4f
	R1hgA64uMDkb+yXxWRaSiw65sM6oMrmOetFeGdyIxLAF7UULKz21M21CphfsKasn
	azN9svbgN0FWb4IPhsbYYzSjU8axhkwCcMePRSIcE9g3wAyA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udnjmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 12:28:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b8f351debso1647533a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773664092; x=1774268892; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlNTVkadnpS2g8Cs4zpmNHW17FU6Ww633NSchLqv76Q=;
        b=a4VawkFbz4jDfI8rmIVCUm+JEsTT+X0CT0SuDRgiFjjqtxRPsxclZGzqlFvI+IiIEP
         998ZDFAiGNEg3V8RU6dpqIMSZidfF/lLyuEXuGb0c2nSv0ks39Op4u366GbLU0nbk1RD
         hpjEAlYmDhkzfR9AW2T4dW6Rjkpxg/OKTCKP0OZ4IgUD+Hs4wUc6A8WZYmLdaMXA+KvO
         6Uq0rrqAP7xI1f+g23Gnx9+6D8gyHcVk0nv+aj7K5g8VIJocwG37ARLkTVmhFm3FMuGR
         qb9kEpax55ADibNxdBKLLewTXMQ19prVS6LkscJCW4mDocBjlh31pibndCVcFE9V3+hE
         3DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664092; x=1774268892;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlNTVkadnpS2g8Cs4zpmNHW17FU6Ww633NSchLqv76Q=;
        b=jYsWjFfS55GWU/RvkdLjXtJYxbymixI37LHBYJh8l8EOGXegajDne8aFhNz5UjSnMQ
         YQEps310l5oYJdKKQIH7+4Nis3a3n9jLqarV1ybREtY3SQ/L59lZiDJdE6/Uqez9cS7K
         r0X2H7FrVobdxccIcTK2YaQRPjcKEIPg5CaCxoVeKAMZLjfudYXqhtTORBpGhL4sRIZg
         ysrtoE/1iMpNc6J2yDKFQXJNYMvJZRAlmAsuJqggFMcCKz608iXafGi1kCGMasCXtj71
         lOS/vJkEVSgKjnnNlwx8KDNwGo+3Da3iXfJWc2u5T3cNDawqQM4/R5KbErvEGhIVSSAY
         JTbw==
X-Forwarded-Encrypted: i=1; AJvYcCVxFkdEKVmuRS5C1nntAQgv7Xm0GTy3DM7s0Z6OABBYkQUJq41j9pSS00JoTs/aTA9rxLntBr934gKz+lFlQjWp@vger.kernel.org
X-Gm-Message-State: AOJu0YzdzCV2LYUIKNsib0V7sdgLxrg67I9UfzgLnjszh5WEJ2tQVMap
	i03FySHwnA48lugGbC3cx2nHYhJ8bK3BaWCSMTnYSo1vKWxecFWPZhmCs+moNckgr2hSEoInWsx
	ownDPkYHn+xWzOzI+UegJG8x9Z39F/PpSjCJR2+Hg4RdCyL3Jg4IL0ebdF4771lNM1WA66Mp7
X-Gm-Gg: ATEYQzy2pb9VsP+FSWuVDPe4zxe2QP3Y4OPuiS9EJgRqVOksOrIJt9lsn59qqfjnazQ
	zkFZqy0RGGyrsZilFC1EsOJG4iEoUSxXxy4V5oZYM7Lad1PtYkPmbDdwlOb3Dznyi64sa7vLIn5
	k4ukcIdo9FqC44S5LPaJR8pH9sv9vWo5E8Wf+aQWOZv5mi9Z5MuhAOOSNA61TTsYtX5+FGaufaH
	GHk9oPPIByRkaueJ+QBJ/tbAG8Leh5uL1bU/8ufM1BZHHbt4qf9Tq9v3SW+9Y38I0Yh3v6n3fx/
	uVHVXI8J1masxk/lXXeA/VZ+ewk48HCTT0g8alELVsBBslxv7eDrLUJn+xfirreRGRfT1MULme3
	6DOy/3rQOwYg+V4uY2F7I1n27C+HGSvhQe2p0HnRXqy1rebvViQ==
X-Received: by 2002:a17:90b:3d05:b0:359:ff8a:ee4c with SMTP id 98e67ed59e1d1-35a21ed3e2bmr10913624a91.11.1773664092393;
        Mon, 16 Mar 2026 05:28:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3d05:b0:359:ff8a:ee4c with SMTP id 98e67ed59e1d1-35a21ed3e2bmr10913601a91.11.1773664091804;
        Mon, 16 Mar 2026 05:28:11 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b8e1cb60esm3293429a91.2.2026.03.16.05.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:28:11 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 17:57:54 +0530
Subject: [PATCH] remoteproc: qcom: Fix leak when custom dump_segments
 addition fails
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEr3t2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3aKCovxk3dzU3JzUxGxdYzPz1DSLVMNEM5MkJaCegqLUtMwKsHn
 RsbW1AAwtd1xfAAAA
X-Change-ID: 20260316-rproc-memleak-367ef8e1a64b
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773664088; l=1864;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=jdgPOEenPrH+BnN3qahgu+WWKGOOmeDRTpXHshbPST4=;
 b=X2/Br6O8Y/+walmutcPBiPVp3+IrMDGWdFDFJ0FaYqdFv5pe/k/isPU52HZXBnlNfwdCRZE/Z
 Topm7iLHkIUD/F02Bs7YGKIjSp7oGOa9S+W0FC+MdF+4q/HCkzTJ4e5
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7f75d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LLE1elOOhh-9SNOzqboA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3lFp2PO5OL80GAMfjCOrxucm6zgDd1ew
X-Proofpoint-ORIG-GUID: 3lFp2PO5OL80GAMfjCOrxucm6zgDd1ew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NSBTYWx0ZWRfXwtaMuwchGuus
 sEwCKZtTy0F4qHQNuEniEAYCu+0RQ/30KqUP3d6Wsznumypw9SpKphXKquK3072RXPweYDDct5S
 kqhoizsoukysZjJ2B55jQlY7fp3R7GhkoDypGMiCkpTHulEpQYPxeZlHpYNAlDDYWtTr5UZoizq
 plQsD1KKR8Ujoz28sF6tleblLfKc4EEulGGNMwkKBSnEvB5BYRnt5joJXG9vdTmutDuUXbNdQzd
 G4EOE4L8EnUinC7QgaarPQ5FlOuFoXvyVgEvD1DXckUVeiZo/lbEXcwoFmbtOczSwu1bhDCg5gk
 G9IW9RRTO0+fhD+dxjluWx2v1pRIGJrqMm4hVPAHfCA96mZdz6RZRCipzomRj3Fgq4/fg2aUVyE
 x7IPQ176e3LAjhduwdbZH4pyxpNGTwae/RN6kqEWskyu4R+sADyyflCG8NDwym8t83vCB4FLKxU
 jPENkCIkRy6SHP83XbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160095

Free allocated minidump_region 'name' in qcom_add_minidump_segments()
when failing before adding the region to 'dump_segments'. Otherwise,
the 'name' is not tracked and is never freed by qcom_minidump_cleanup().

Return error when adding to 'dump_segments' fails.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6c31140268ac..aa93d3324561 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -110,6 +110,7 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
 	struct minidump_region __iomem *ptr;
 	struct minidump_region region;
 	int seg_cnt, i;
+	int ret = 0;
 	dma_addr_t da;
 	size_t size;
 	char *name;
@@ -130,17 +131,22 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
 		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
 			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
 			if (!name) {
-				iounmap(ptr);
-				return -ENOMEM;
+				ret = -ENOMEM;
+				break;
 			}
 			da = le64_to_cpu(region.address);
 			size = le64_to_cpu(region.size);
-			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
+			ret = rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t,
+								name);
+			if (ret) {
+				kfree(name);
+				break;
+			}
 		}
 	}
 
 	iounmap(ptr);
-	return 0;
+	return ret;
 }
 
 void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rproc-memleak-367ef8e1a64b

Best regards,
-- 
Wasim Nazir <wasim.nazir@oss.qualcomm.com>

