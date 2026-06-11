Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483AB34B66F
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201169; cv=none; b=BYWglZ0K/b5wdcCFepfQ3Ije+iH6tuxZ6QEmpHG/uucTkjpRaL72ZfPg+PPyf/0QSn/T2ApxMyAqofpPW62xXlBweh16Owjw4lyit6k5j7wmrQLM8osg+JcJquGOzdxV+sED5k72djNTo+8GveKaLxRQImkvG5SGU2P1xEGlwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201169; c=relaxed/simple;
	bh=c5sQCS7LrMJzekD/qu/OYTkJyoX2vnDlQUjk9HF20EE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHbWhHgOY1lGW+d6k4p10tyCOhg44z/hLtqGbHe5wvyvJrngtQfOUyq1qsnXXLvo2VKHw0J6O1dUCebQ4AqISC1kNEX85y8czIuzIXyq1T9OGq2RVOwvQr35Nc/ck/aQpqoLpuV1jHTAH/nCv9T2lbWEERqXQT7oDB4hm4n6Jg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDDFt+ka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XiEtSGxV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDDFt+ka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XiEtSGxV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEsHZA956206
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z6YZVFBXjGu1p9kk2tGdhqMn0/oSSfCgZ6i
	CkmIQ98A=; b=aDDFt+kapEkV4JTTHA5xFOXxUd4cHvrc5eI93DxtK3b4wkE4u3S
	SPaWlxeXqSRiyViBvKFCEjBmO+cfIlgIrgBUycHKf0XbowYH0NKNLUxxYFO3ZEkf
	31fk0yRui5FFOloi/gVjdo7Q1XoEjG+HNDD9uvQcwXrgbtuk/+gNfR4fUq+iWmE5
	J2FHoF8zoEUsC56rAOJu8EkykeY3EwaILTItx7/BOzc1lrND0A/MXCu+t9spJbkD
	awrX6sQRmadBUCT155Ktul/1WqgQdGSMTnW8BDRItD05BXpDXAmheN4IyAmRruC3
	eX7nNWlDPt05R1RCjK4aHxCNbDHycS5JbHA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe704wg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8428419982eso146555b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 11:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781201166; x=1781805966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6YZVFBXjGu1p9kk2tGdhqMn0/oSSfCgZ6iCkmIQ98A=;
        b=XiEtSGxVIGRvxYPD8dyGjk53h9Kr2kWuPO1897ZeHpWJ9cK4sHUhambxkCNuw1RQm7
         9sdgjQkc2qrdKZJSqB20n2MkxT/UP+4qYxfmFhSk1FKi2GfyPxGgBopH+5lPXXc8JG8q
         w0pCNHzDQiD6HkD19FuUZcfL6XfWayWlo/d3Q+ETNzGsVRap4S8zFqbYRE4/NCYXdSNj
         3cZt6wOwMupxxRmaWkcwxQfkC+tcwSVIq2mnSxq5/uAbtgiJ4vRNQ1PBrSqKkwWZ0iTa
         ZAo+i5bDEy8QaTFnbiGLfWs1OqMz846VMRET68/boe/4UVpsdAulfhg0kWgYIygFJG6f
         UygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781201166; x=1781805966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6YZVFBXjGu1p9kk2tGdhqMn0/oSSfCgZ6iCkmIQ98A=;
        b=dWPqON216K+XL2WqYcJV/guUgDLvSsyyioiUSF5XmCxmogXR1NTKr6+Hpzggkv5T7b
         ZyRQmxX9A1mSDaYcrJgbnvpTfAYy+a//qTqcJiUte2Mt0TgovGqrJA1ZsAMANh3cijrj
         ZHzKts6b1u7DsP2od1HTQHhrdfx2VTGr/+C1klaaJS6I5+MLtdjabjErMwX7RbOWC1q1
         xkvPvS/gz19OKneVPAp0vl58Kti5bRoWbA+j54pE00EV0ecdmO9I+WyrCd5yxF1n2A4m
         oqHCGs3AUr9dSRD+f28L4dAdpOE9vjEZvahFqwyA97XsaTuM9WFGuVbORFBquXmBYpqy
         Pjrw==
X-Gm-Message-State: AOJu0YzW8hF4gtf2FyyJh9wkymACFvhs4CMpyMv1uE5EWnCI7IcBcnUC
	ZAdovg7SfM4h89ZTo/TMwUAEzZeTzFniItIQ4PiAISY9l1Y7tgD8mszUvHLGy7dfw+PUyHPXqlR
	Ze+ayAk0nOQMkHR3RgagLLZb1L0hSfBY2mJagjB7DiFa/b+f476s/g/vhdXoZEEtBciXpjXvM
X-Gm-Gg: Acq92OHoUJgh0tD1/Dmgb3gCGv2WYzbJ158tV62FFpreHzbkR+FLNxUIGXuwrshKLdR
	72JDktd43gNRFBJ1ZaCiDaHoErRMOOFtTH0u0ROfqnldyj4dUAn6I+iQ7UdmjODyKFz+2wr539b
	8TieInZbTgCvMZKw6wUT9dZFN4uhZsa8xP5PLsZLQXAZGaR5xuyYz6EiPXH9LFProxHMZbRFZ2W
	fYfG4O21AVtEcS1ZnViEQBkImGEYriYQqFrS5mCmN3jgY6p3Lyix4bCYGVzqxrXb6vI4WWUh6BP
	jlM6CFfVCdZw2jlfefHxLWCHdooEHbD82W5zEu7ivd4fCES+jMjQiIvQ2g2wOBto3R4491oVB5v
	pI+Rbfq9VswUw9FKf7iY5OFl8J5Tp6JAjR0ZfAb0h4OKp/Dbb
X-Received: by 2002:a05:6a00:9513:b0:842:7296:dba with SMTP id d2e1a72fcca58-843367daee8mr4505419b3a.7.1781201165641;
        Thu, 11 Jun 2026 11:06:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:9513:b0:842:7296:dba with SMTP id d2e1a72fcca58-843367daee8mr4505377b3a.7.1781201165076;
        Thu, 11 Jun 2026 11:06:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843382e6e80sm2597688b3a.42.2026.06.11.11.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:06:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] remoteproc: fix coding style issues in remoteproc.h
Date: Thu, 11 Jun 2026 23:35:48 +0530
Message-ID: <20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VXNAmD9fipMJVcVKsD6Em4WrtAJezG2P
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2af90e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Gzwr2_xYWqWeu_vu82UA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4MSBTYWx0ZWRfX/sGe/Gmh0Npt
 u3m//i/etH/J6Hs3kA4O93sFxTsor7NMBAFH+Xua2fHvvu+DCojpQVzYSGm3xA0QhY0paW7Ribq
 Rw5h6OCiUnZyVr7unI9absY72V7qoGWyS3LIQsgHJkzu3HkkI4pvdOwSO0pKpJIC18sHfn/O3BV
 h9KqG7EFPgxGxs4816rMGxRdmFX35l/W/D8oxMAmvIWoBziiOdSK1KAJOuD4cTWj7LAMd4ZFImn
 hOTavcbzHfUyr/x93g4WTvbMzjY7yKtN2OS6Gz0kgQvHsuVFGWFMPRL3b5FLz9gN3a1sLsUvjRB
 RwJDjFQhYIL7io7FTyFcoi+0eXzaROSfRIugOsYUuWCROH0+80UAf2ZRFsgVavNuk188BCqRfWU
 JxI4xGke6w5UfYuvCBQF0hRvQ8s9rmJeapWof8QgbaReTeYjGUzfrmU5sZY2ZQNKZ5GJ/U4BOn7
 ksOMvbyVapuWULUqMsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4MSBTYWx0ZWRfX11rRi9/4v6GK
 toTOj10/5K1vj/Y76kzD0JGKU4Nu0sPR7AqzF9j7HXw22S2BFx9NtsQtQhyKaJPwYzKdfgEiPim
 OnurjcOqnh4gz2+X8UnkQYdXi/mFKjc=
X-Proofpoint-ORIG-GUID: VXNAmD9fipMJVcVKsD6Em4WrtAJezG2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110181

The function pointer declarations for find_loaded_rsc_table() and
get_loaded_rsc_table() had their opening parenthesis at the end of
the line. Move the first argument onto the same line as the opening
parenthesis to fix the checkpatch warning.

Also remove a spurious blank line after the opening brace in
struct rproc_vdev.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7c1546d48008..e0e212328acf 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -127,10 +127,10 @@ struct rproc_ops {
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-	struct resource_table *(*find_loaded_rsc_table)(
-				struct rproc *rproc, const struct firmware *fw);
-	struct resource_table *(*get_loaded_rsc_table)(
-				struct rproc *rproc, size_t *size);
+	struct resource_table *(*find_loaded_rsc_table)(struct rproc *rproc,
+							const struct firmware *fw);
+	struct resource_table *(*get_loaded_rsc_table)(struct rproc *rproc,
+						       size_t *size);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
@@ -375,7 +375,6 @@ struct rproc_vring {
  * @index: vdev position versus other vdev declared in resource table
  */
 struct rproc_vdev {
-
 	struct rproc_subdev subdev;
 	struct platform_device *pdev;
 
-- 
2.53.0

