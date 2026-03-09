Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C50F426EB1
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097557; cv=none; b=QmlMshtPmbEzYVkpyOpNW+pSvhpVyJAw+SetWejaQcWRy8HBhkbKKnK4+izxTkuyDUIP/HRqc2gy/lqJuGNMrwlXdCCAFlsEDOQxZN91tMFVileNzXwA88Pz85rhxNjL5xVVJ7RCYlis8qFAGRXILhZC5eAv7wOOykIRXbIe1r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097557; c=relaxed/simple;
	bh=BaDqkDWGu+XD1uojRzTNHydt5ix2dxjskfbmR4KTJ9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S34QpkpdYYtjaDIhxTRsvZV+jrDW3fxQZJTTVmFwapulIjE86bKO+TRIitgq68wQWjaddxPMXdTvhYRVyUzbbrPmYzLwNRPLlyGvK0PrgLzDe0//qYZRB/egt2EAji+DVtV+8MckyUBeBDANfNY2lf+6FS1C1Rlk/kY2IkoY1b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPv3YztV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMD611H/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPv3YztV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMD611H/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBlbJ296193
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auzznPiIzKm
	n9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=; b=EPv3YztVJ+FAUct0n2jY0AEZbxq
	N4yJ5ZDT1QeglA759UBVXPrEh3zXHp5Ray5s7pgfyA7mLlCX3AQyJdv4N0XHVz1V
	OZ9QVTI8oCqhTWzLM+cVUnCNq+4M5Yzl97VoxT6SmJnlYgveq6RE7m8Y0lU7CCcx
	k8Haf9d+4068xXR+NUlHuEi8Xqxp2N3uCUYTJneVk3O8E/tX30xB4TcMIxeqWoZ0
	JUFI6cMGgngrsXg/IZO2SB9y28JcPOBNpWnXBZTf8w6+yGT4I/WFdTaYfJcOf32Y
	WMB2yW2wjsiFRzhTaGFIC4a37N06tgo/lxuGc/eVVPmJ/AV+usj7OzLW6dg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1rv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:05:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77502295so1418672185a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097553; x=1773702353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=NMD611H/h19jKpuLsVaSIEZmStieghkesArYWyGMCGWr5SFxYZngAP+FBROJe/lsSS
         K/adZlpKfn74TdinIBrHZIegYjsL/LU1xzbEqeNOJO+VF800E0Ko9v9fCbsvI3KKQJhn
         +F+gkU8beWD/RXhKXtAi7STEGjltqpOFs0uAZCL4QFObQFVzbKNV86yxc3Rp/wZNJx6l
         Zl8dGLD+82evulOHrsiy5GnDWGFlt3nlf/In8XAniBX6BexHUvyfErZHz6De0RZtHciz
         48kkU+3UA3qB+zqG9fCPxaWdDJTd87fGTjipMzRupo2yZf/hc0AcbfGeLv2sMbwmIduP
         GzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097553; x=1773702353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=eyFHIcqIbtuNmeKwvmXfFMXwwaXqLR55MBV1uiXj3NVyNTxJZtsJEw6dKWOGfoQ9UK
         EcqQoi3OUyy+QIdOW87HYbzE4r4ijr52a7PyjqYmqEpAcOV1tLvllj+knKuGUcXpd9A1
         c9X2pAacI+7CawIFoBaFXZ1oVjCqCTONXv+tycuD4eRbLHUbpPRPppfuh5VrXmzDQ8cv
         T7zk1gcrrG/ARpWKWs/3cre4ceTWWYgtktDczBK9ts9J4RwUb8eF02KjZX6ZuvvVZfrE
         vvq4ypBo5ZVFwKd+yUPwWjP/jhlhuL3EKBTU8eq4nTY6SHJV0SW22yOl3BqKQacFoMOq
         cY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWg/3YrTIsChQ6DQmoZ9ZUR5i6B4+aaU89qtk6ZXWRiKbunS4W7r/oqvekUWk4rMVtqqbwtutp1SQ3aLzj/+5gj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1uLoVrILaqMX7QsIRv3qZVVkcf0e3syWdyshEqn63AbBmdeq
	O+qHf1HV2Cc3jkFmzMntc5lOE9Xdw9CnZ+VboBOmbEe4+35q1uwTpoSXQyK6aHfODCVXs4pE1Mr
	hv2a6XKxe/QQfAT3Lo+lQ53hCRiTAKJD3272Fs6nKRjaanac1FnD4oPrW0WfnrMYhrYvN76hp
X-Gm-Gg: ATEYQzx65E5YGSShkShdWX1uhK3SBNIQ14sQJb43TCCPHT2EFXyigEynngvqqyLXxNj
	FyJhHec6x2u42t5bV651bvmv0+5hFIImOsbSXkoJ9S07US0jLnp0+zyOIcv65NxIQLxr3RrDkmO
	6i8oYCuC2pefNo/lx3zBTjRiiUZlvx7sKLkHIgfO3oMijqUlGWVnFEUHsgzf6E4bYnTp5ZXSzOn
	JSvux3mWU4vrntLxpk0o1Psz/mq5VhkNDYRUe53+7QweS/J3wNR8sG2mqzWGj1BZdVjFu8E2tUv
	UXBDhLy0symaqq77tAvlsSQgZ1OYx1qO6qSTeM0ZDdBTJ/WvBiZ2IRAD/v1hi+c1jqlfWUx+k78
	15qVVf+UqbNQU+1BblRTztLLR2xJkS29VGCz3kI0L8pbbPy1R/A==
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622778085a.77.1773097552988;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622773385a.77.1773097552533;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:51 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:33 +0100
Message-ID: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX0IzGULsj1cGS
 R4Kw+YmcB4SRzQcDxBp5IksTblo0ZLBaTsYqZUd+lYuBEaeym1nIl6pR/B7GQrQEsiFDWrdLuWh
 2kV4gvUIyXhvP+Yy3C/LVWY++pGQ52RiHOiUZYBoJgcKWO82/w+mPJGMYl5FZoeyLWaWBLqib8I
 gCu13AjX0PkIlTSgM7A5bT39D8qHEJHqpH5v611895TSczhFHbicS1THAsIJ+3L7MUTltSYKfdN
 5xWAOIW26/6vyQztHM7l5BquU2iAwiRXUD6W98gHUDhJQKTRluKw48CXPspqJ6UTegB7iWaHHoJ
 jq/qoUa1ZIGCLzomGTa+N6Lbq6mLXA45LsS/Y/RZsFQQfgGI/BpaVQEE2I6p2F9p+wye/8UUXO6
 noKBY2q9i/8i+6abBfD2t13KkA4QRvXH9lSB/GeUKjYOF16ilNbGAgLOwT40mm2l57zpMGq3ESx
 cmsH+pLAEipsVqN0Fdg==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af5251 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=LIGoIQd8k4OXu6S84WYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5GULj3KS2-FGKAzaf-fYcKZsvoSpQ0Hg
X-Proofpoint-ORIG-GUID: 5GULj3KS2-FGKAzaf-fYcKZsvoSpQ0Hg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index cf10e8ecfb8f..5bd4147f1f37 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -677,7 +677,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 		return ERR_PTR(ret);
 	}
 
-	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
+	qmi_add_lookup(&sysmon->qmi, QMI_SERVICE_ID_SSCTL, 0, 0);
 
 	sysmon->subdev.prepare = sysmon_prepare;
 	sysmon->subdev.start = sysmon_start;
-- 
2.43.0

