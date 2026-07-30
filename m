Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F43E6383
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401707; cv=none; b=DJASB56+4bCfyEho0vdPELydB0aMlRWu1oxD8kMZR6bVUwTM3XQ/pdidzwQ6K6jMLXqni70wLon6Iv7zNcobPIanQdDTnuWJXV0OhYkIO7jKtr1o/LfjsxDC5EgbTwjxWCQLW0nUWyCVxDQP4hrOQNFJMpK2NQpKIfbCp2eEvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401707; c=relaxed/simple;
	bh=lY1F4U7R5Q9MbXeDabAh4UTs+A4HBRHU1aT/8i88aUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jraqcf5Vt5eNFt+Y7AxbOHVrDkMYHEtKOv+9hhgHo3Safs9zcJkGRHq4cPIFFHwiJhqoCTUmXZDEDEma5WQ7LUWHcIuaIABLgSrl4wSFh4rPukOxoaeLIcV30hmEacJ6c1q9c7zp3sP2rFYY1ACv/UyH7d3qSf8e0gvWwFencyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWBDFV8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGHqHesV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWBDFV8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGHqHesV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8rOp9778305
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j2ShT7GhCl/I4voDJ+WZ/zUoAfJWeGYndSb
	sfa2r+L8=; b=SWBDFV8qAw49q3SoDNCB88oB2CMoRjXqIh8W65hSmD5RnoZQiEi
	xKyCqmpwyINYqg2VRdJ/zVxi1mYGJRp+HIeHEfaLDE/mdz5DWEjDvD4eiGvpBalv
	tq+6SZqG/NN3PUkGpqJGymHmT3ACNTI5rwkAbgUgvtercCtSefcKPM8PGd830i+x
	Nl59zD003v5XMq+anPE+lWp90EcGhgJy52+mc3sFkd1O6ty5lX4PKbhYTrfNd1aG
	W6Z7Dwf3FxRV5bCEKUBFjImtz5IgwUBrKXy6c0Ee4HzfEMJsyV8Czy8yWP/WljxM
	hTauc5eUNDXdeSBQhe85kZvMM4DGlnHQ6LA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3gdr08r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487eb67173so3453485b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401686; x=1786006486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2ShT7GhCl/I4voDJ+WZ/zUoAfJWeGYndSbsfa2r+L8=;
        b=fGHqHesVTZVzX+bd2W2YGV7VNjTx//PAfFKDxaqkQeLTGA2S5JisG11v1H3UJiD27v
         vDyRai9eOX0dkDU30zARHl6g5CB1ZAw84f6v9CZ+M9TBa15HAsjCYD/08wilbldWjfom
         INuuG5mym6XdipUCJvR+M9DNgZNh1XG9HKbCDh6oe3HU5H5Ta7ULRnyLUeNW5g4oa2NT
         9gJvFFzHAF3l/Ur9qZ2IVt9Mud3ZFpJLI69Kqsh5+g6ksKen7J3wHRWXGHrDSKvLFysj
         vj3MLNGFvRlG3poL81Q54mw3Ad6ZTZWieLZGYRntEX6SIn2+YAynNBEAxnlIMRZ9XpL1
         boIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401686; x=1786006486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2ShT7GhCl/I4voDJ+WZ/zUoAfJWeGYndSbsfa2r+L8=;
        b=UgQVILTzisg4WjTkzSCn4mmwKObbOtSUF2YTROls+/cqEDK5F2RyGN8xbIfln6PORN
         x9b7QuMsoWfZxQ8bV4kOStMETJgukovpDiPkcw+yoZEmdvO+wQam4NWLupxqwriSOGoj
         GI1GprAkF7wqV6LsuxZgxB70i/zUqCwZdWwZlq3OMe9qf6kKUijMZccfg7SzxoNhww4s
         lFv0Yq1Ru/WfmGZy2i+VZMXj1tQtZaX7kbNgsUBF0MejRBFr//PS28Dwpe1hc2011OLs
         Kc+xhCkwKlGRw1A6aim9wK7lwqYdJDe9mevsnvmPlDyIeTvyikIPVW//UdcoDus3OK0m
         6YXQ==
X-Gm-Message-State: AOJu0YzxFllHErRW5Q9bY4z7dP8WJM7gk3tKtkFhzgN6MMVD4a+C+Aok
	34zPWWyTLK4Qw7E/o5WcUdg/NgbE6vONAD8DGhLsVdjXxiZWnwBghb5HFbRkoF5FAHIU6VpS1AG
	wrgPkJGAf2v7hPlVWhQPDK7nuo20QbueBZfks28cL2nDiEtzmTISEoje+QMTez7Jf7+Q/bkHR
X-Gm-Gg: AR+sD12kxKTVgAKPmmkVZTGntzT6FvghGdQKO5kVGaA5UQtAzX0LjTpyoLUe+aPconk
	AI5qIVChIMBbe39qP2GyRqVglA7G5+c1v8ji8JDAhMga0xR4npraTmP7FWvEiSlm/oTcIiwp3D0
	POHPw6E1B0fRbBNEL6ycp4Z4yHOHjqlL55VmGkSmwFEXs3SJCmrsKsalVGo82/LfwadUzRCEhFy
	4CP9yXdrGOWxPcanRruyU5q5aLu3g5IAfRna3Wrxvh1BL8aRA3tDon2ouxs9jQMli7SKUZDW/WW
	Q1S8Sbw9Sy6++NWK5mC30U8bR9IzzHimqJxKSWihdBHf6DL2MgxX2kIwYZgJG3kBQuR1rgMuekR
	9NklTyvLoYFYlKOI9y1pSDBdYzWM=
X-Received: by 2002:a05:6a00:4218:b0:848:7f8a:8cf5 with SMTP id d2e1a72fcca58-84ebc3dff16mr1840938b3a.53.1785401686417;
        Thu, 30 Jul 2026 01:54:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:4218:b0:848:7f8a:8cf5 with SMTP id d2e1a72fcca58-84ebc3dff16mr1840915b3a.53.1785401685882;
        Thu, 30 Jul 2026 01:54:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe23120sm2774402b3a.11.2026.07.30.01.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:54:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH 1/3] remoteproc: fix wakeup source leak when crash handler sees RPROC_CRASHED
Date: Thu, 30 Jul 2026 14:24:35 +0530
Message-ID: <20260730085437.1240215-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dLMVmH_MttrReU2ludvxz8_ZMHqb4PkP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2NCBTYWx0ZWRfX2NFEoxJkyDmh
 Ifv7OxfoKUT11A/iAjF05nJVZ/vaGIk8ypczlEw0vTVz8mazthdb1l96D7JFa5CKsXdn6X3xUpI
 UmyJPDxOv05F1W1Bb4dGCYfYe2KuRUtLlPyTJiI4TLHl8SULk2DtZhKnhTxnIlAZiIwepT7eE9n
 IGajcA0EJCWY5Xx4OgxvuXYH+jtCF+nAkpjY+nhBlQxWGdj9Fp3qpDL0nw3g5WQ/+p7TqZf10s0
 ak4+5Q6Fw3McJy+uhwK9xInD7fZhmH58DMJaCCyspKyckRXeKkV9Vw6X7lt+6soyutzSEEuFHDw
 rIzU72bTWZ7Y0tJRzTH8E0O09ybK1wZlEazKy4RYf7b6i0CHaUD0Jo0tSVBaGOTp/9nghZHZ94U
 K8fD9k4OMrTmnzWP1vfAvyB2U9wTKEMowqXVknFtr8h2TQ0EcdhO347vPXnQTLM94XevMiqn3hm
 ctundo//8kcURJ2Mg5A==
X-Authority-Analysis: v=2.4 cv=feydDUQF c=1 sm=1 tr=0 ts=6a6b1162 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2Eab-JvoF3yqxpIrmcwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2NCBTYWx0ZWRfXxoxaXXRJKhhS
 QdVR0J5JG7FeCBrWKraXJ3jcFl2JaRaQg4YpdwRCvp/MQTAbpVlbnAOKs18MVIKUfpjtI6UAHXU
 r2lVgBwkcI9ru2eRGMnG8OYlljlaWlY=
X-Proofpoint-GUID: dLMVmH_MttrReU2ludvxz8_ZMHqb4PkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300064

When rproc_crash_handler_work() finds the remoteproc is already in
RPROC_CRASHED state, it exits via a bare return, bypassing the out:
label and its pm_relax() call.  Since rproc_report_crash() always
calls pm_stay_awake() before queuing the work, every crash reported
after the first leaves the wakeup source permanently active, preventing
system suspend until the device is removed.

Change the bare return to goto out so pm_relax() is reached on all
exit paths.

Fixes: a781e5aa5911 ("remoteproc: core: Prevent system suspend during remoteproc recovery")
Cc: stable@vger.kernel.org
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1ed406714849..ee9354ff69f0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1896,7 +1896,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
 	if (rproc->state == RPROC_CRASHED) {
 		/* handle only the first crash detected */
 		mutex_unlock(&rproc->lock);
-		return;
+		goto out;
 	}
 
 	if (rproc->state == RPROC_OFFLINE) {
-- 
2.53.0

