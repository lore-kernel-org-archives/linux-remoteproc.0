Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728919C553
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Apr 2026 04:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775449845; cv=none; b=BAp6YmX6pWVc8Rd8CunpdKqMGn+O2YBFPq0wFP+bd/IDbVt3969WShdPfMfyvk6MdnnUC+tmftU5yEHUsGAZV/5Od1Xo3HmltIfxj+LtfuefXNffLi3mzR6BsEhPVgweMjgtMO+HcTKmuBtbaTaMVaXtb4p2YPGo2vzH9NV9DU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775449845; c=relaxed/simple;
	bh=Ld3rI4HU9cxqPAJCs9fiS2LjF6iafGueX4DRBPXkJmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dbfLHPmj3Nad42oS+dpBjJeKKQ0NxFP5DEJM0gcnAAMOyJmIxZp1AhYfDlbSx8aoIesI8B4+ZSDfsaLRn6YiLUFInBoXxi5RT2c7p37YHH9WoVTrVyLKv7eAh3w7lvWsn33viCZn8gl7+ZRkCjPlT61j82e6g5wb/9wNbHi+IX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpqSJQLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaMnm7jb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpqSJQLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaMnm7jb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635E9phU3775505
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Apr 2026 04:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w25Sm7lE9Rpb3uvEU9UJ//
	etf8MNyGKrcBoSoWF/oiM=; b=ZpqSJQLevIcWT0xFCNiQL/EkrED/g8WF/ryvJ1
	KlRwOE1GQVXqhCK1a0brOjSt3RS2jMsBLUMd76PCC3D5nYpAXeZYbdONYOIQOT+s
	KxYVckR8ppNHkc4ccKbmgwV9O5PgOBu/JEVwAHadjRSVyIi86KhuumIxg8NkRplQ
	QnAd+3kmr7Th0fHUxZzaTQ3N4mVbKgs5lijN4+eMYscHqSmv2JqsgeTT0r2kvX3C
	5u9XihASK6VlwfhTyD58V4UCfTTNNcyCgOwXzun8ovWcnL43Tss5pcUMYMlEK7NO
	ZiOn1yhIqyWUdXoj5mpuHeHIs/YQoMTUKMoWYub9MoBXgS/w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd3q7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2026 04:30:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242062308so84781335ad.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Apr 2026 21:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775449843; x=1776054643; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w25Sm7lE9Rpb3uvEU9UJ//etf8MNyGKrcBoSoWF/oiM=;
        b=aaMnm7jbBDdi5BIO0qkVTBoUspHJ6K9nNEvbiY+hAkkRbDxH+BMe2oI9Hg2aEr1jD7
         GEwcFcmWqjwdztDDUgKuHl/GB9taYeB23eFL/1sDIENZWaT6Gabl+5RNgqDDC4MaEKSd
         FBmujY3hsMApF/KZACVolNMSrEtjgtQbXs7oi7U0NE95QO8XmMbrg5nI003jenJIzR0Q
         PJTnA9MYs1IaOc/2q0HKav99sjEjkJcRlmiYM4yPWjkSYpcn7jD36lpCJAEJsum4p22x
         ki1BKVPkRRUHn6GEa2D3vXtXSszjdkUmCXR3v/h4B7yfOu5HGWjAB1fPnOlcCgLdajfi
         iihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775449843; x=1776054643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w25Sm7lE9Rpb3uvEU9UJ//etf8MNyGKrcBoSoWF/oiM=;
        b=Hm7bvjcGqgdMiAs/LWVobaXJfJA/5zEeIHKOXUn3K9uSstaClL5W6rDeW3W8NR60BY
         wyxWJN6PWH4qz3juaVPbUClEDXnwn/VI62pj+yaYjW4yJENA+qaGknRLtBl6gGorxABR
         53X9wcdDmyCo8//mWnoTNIrcezw9pvjUbZ8tAKFjIc4z8l6tErWLo3LD0nLmUbh84svX
         nrKLC+k5tUKygVX3qFDg+siTIKQYiES4lN4uzaoZOxk7B5wyX6lKiXrz8hmnQP80Tc73
         IUuI6Wos3Zun+Hj2lj3IHENhYyUtyWUTT4hdOVixhGIr7sKNUdAjEmPHZIoohbz8UYK3
         n1mA==
X-Gm-Message-State: AOJu0Yw+kX0BMwns2wsNHVcIL/6mTgLjLgfuFPR3441DOsdJJGZDAd+d
	uzxgnMVI770VfGV5jxoW4MuqokxN3Bqe8zGh8KN1OoEOxpnw0dY4pc822nucnMq0vZbWE9QO7Hz
	FLrK7Vc03rj16xeyyENcyTZK5QLdq7PPbyd/A0FoLeH/QEEzktTQymI17TU9Khm+YXsofaO5M
X-Gm-Gg: AeBDies3DX2ZVKkhy3aY9dYIYAoeLzz3huy5DZU46UbmaqF6Xl4ODDNmxSEayIH+x9y
	ih1hs4Jev9fjDkCUEjwjh5PRe0y582acKxeLSG3KHKh+noZk9LhYNzf39vK6Vd529gNzwApVjSq
	jo7uR2TT/ned0rNcgIOwxN1y9ClZvqabGWHIFMclJRBcp/jVnVbzScBDCShL9TC/uUbRlFD+n+a
	gtU59hHuabhEptaMsSthapBugjitwT+G+j0W64D5NX6qHAGXtbaK9ULXmn5+3JNmObm5g/QWH6S
	ErHCXmcc8r0p0kUsxSrjXWljSWEJ3QF1HHE2eSflVALPJoJkJqKjI2Y7NP1E+8tBCsLfcSQBeFh
	rX2l4rNT6v7gF7cPmPTE6D0uSVw9Qpb7AYhynilWuhJfAVHB/IAGBMD6O/A==
X-Received: by 2002:a05:6a20:734b:b0:39f:216:f3f7 with SMTP id adf61e73a8af0-39f2ee497ddmr10419732637.21.1775449843023;
        Sun, 05 Apr 2026 21:30:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:734b:b0:39f:216:f3f7 with SMTP id adf61e73a8af0-39f2ee497ddmr10419678637.21.1775449842292;
        Sun, 05 Apr 2026 21:30:42 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6475ae9sm11147212a12.2.2026.04.05.21.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:30:41 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 09:59:50 +0530
Subject: [PATCH] rpmsg: char: Check for ongoing chrdev destroy
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-rpmsg-char-fix-chrdev-destroy-race-v1-1-7317434fa246@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL0202kC/5WNQQ6DMAwEv4JyrhEJgqCe+o+KQwgGIhVCbRoVI
 f5etz/oxdrZtXYPxUgBWV2zQxGmwCEuAvqSKT+5ZUQIvbAyhamL0ligdeYRJCMYwlsE9ZigR94
 o7kDOI1ToukZX3jTWKSlaCeX1N3JvhafAW6T9t5n01/2rPmnQYG1X4uDqpkO8Reb8+XIPH+c5l
 6Pa8zw/KgzwGNsAAAA=
X-Change-ID: 20260327-rpmsg-char-fix-chrdev-destroy-race-5eab815c287a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        deepak.singh@oss.qualcomm.com,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775449839; l=2077;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=ATdFIg41ysmv9FfpOG7pYxnAI66mMxvYFdCUIHLt4vM=;
 b=YbhDOJ+rSl2N0MSr2MExIgve/akCTFmngd9lDskIlpWltcfMaZZW9S+859lO/oScf33OseB/l
 TlN0GLIJUfKCG57zZDY9Q+hduttju9atc8RLYbJ1iehiBpHlzD0XZFG
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: PJgjVj0klmoncOWlgoc4lucjBbC3E22Y
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d336f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=urfA8z1tUu9fd5TEvpAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA0MCBTYWx0ZWRfX60SQwNfG51uZ
 EWukVfo2HPuHCTAboeDvl6cBt6yGdYKRujM/OpGAI9J4Q0mwPCVBPSsGrPUuDxnQ+/nnKVxJxtB
 EXc6CUIBIqwkyu7WR74F3f4cNFuH4TRAVlpxHCWgwjczFMtV5zolX/siMN6v4xJi/Oy2hVzh/Ml
 IVVz/WK2xryENFdjBDXTefIqLjfXNjVMkhfQrEtW3RE8mDw+Xm/4BCOMOL0E+kyLvLRPzivSXgD
 YpXcNb04ubPBGoAnOvWywwp7NdMBEE68v/vJFVok/PZhIhnxvqTN740bnSd7Ihw2ScxdnHU1Mal
 VJp+W4Y6ySaSlNI3LmW9aPCu+8LLU7ynt4Kn27zlRZIrifzxN8BxideyiWjD68WSgSV0RM6CIon
 H1+IX/psrtyiOctWSGpZqG8GPmwd34rungZD4x6gq2BXA+CT/JEx3AUJvyZaq4L5GTg9R6LxFOR
 VVkvXcooUA9VgNPDovw==
X-Proofpoint-GUID: PJgjVj0klmoncOWlgoc4lucjBbC3E22Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060040

From: Chris Lew <christopher.lew@oss.qualcomm.com>

A null pointer panic is observed when stopping a remoteproc and closing
a character device using the RPMSG_DESTROY_EPT_IOCTL. There is a race
where each context calls rpmsg_chrdev_eptdev_destroy(). The thread that
runs second will call cdev_device_del() for a second time, which fails
because the first call already removed the device from sysfs. Add a
check at the beginning of destroy and exit early if the destroy call
has already been done.

[ 26.654130] Call trace
[ 26.656658] kernfs_find_and_get_ns+0x28/0x8
[ 26.661140] sysfs_unmerge_group+0x2c/0x7
[ 26.665357] dpm_sysfs_remove+0x38/0x8
[ 26.669305] device_del+0xa4/0x3e
[ 26.672811] cdev_device_del+0x28/0x7
[ 26.676675] rpmsg_chrdev_eptdev_destroy+0x68/0x98
[ 26.682765] rpmsg_eptdev_ioctl+0x130/0x11c8
[ 26.688318] __arm64_sys_ioctl+0xb4/0x10
[ 26.692448] invoke_syscall+0x50/0x12
[ 26.696312] el0_svc_common.constprop.0+0xc8/0xf
[ 26.701151] do_el0_svc+0x24/0x3
[ 26.704570] el0_svc+0x40/0x17
[ 26.707810] el0t_64_sync_handler+0x120/0x13
[ 26.712288] el0t_64_sync+0x1a0/0x1a

Signed-off-by: Chris Lew <christopher.lew@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/rpmsg/rpmsg_char.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index ca9cf8858a5ef2ba11d8a99fde1c3393e381ee59..408d3c255f8b6c13c0cba443a2de46000e58d555 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -79,6 +79,11 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
 	mutex_lock(&eptdev->ept_lock);
+	if (!eptdev->rpdev) {
+		mutex_unlock(&eptdev->ept_lock);
+		return 0;
+	}
+
 	eptdev->rpdev = NULL;
 	if (eptdev->ept) {
 		/* The default endpoint is released by the rpmsg core */

---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260327-rpmsg-char-fix-chrdev-destroy-race-5eab815c287a

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

