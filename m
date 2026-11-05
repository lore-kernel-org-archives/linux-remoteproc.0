Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881896;
	b=5gEDb5eAo/YbvejvAFarppD/bk9lNd6+wjtPHpuszrNkrCP+ajIrsDPx0jn2W4luIozR
	 G/MtUO+JQWevRa8z6K2vcqcHp6+Oaim44a7UkCa7+QVl/NPJBINK+t3OYWKdfeaKhq3Ml
	 oCXzFq3l4w/gx11Tm6JvVmDlLu7m0i5DLzcYO632zEBZDL70kONjAFVZaekVSBWbR3R+b
	 MIIKzG+fjPvXnz1CQkmUSJRjW/TniaTqx2zD4PEazQMjkccU8k/dwKno9nsJQj8aXBn/w
	 Uni0KCUMLuLjfYjI4fIkglLxlPxg6/e329O8dCRU5Um/at4+hskYn832SMPDyfBfk3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s2k+6/IDNmT6SFeMIneO9SpU+2c9mLn7ihon2BlbEuM=;
	b=jzSF8AbKmudi5w/JAgvsyI7o11Y8bWfJG7O8bS2aDLSYTb7KXaAYixcaCUecvna0Yul8
	 c1PA98hR7L99Q7Sli1JWUZAXpiRlZ8CKJNErIPV9e3R6USkfEBIgQr0LIj1dvf14VDyCL
	 7z86OptFUihhe3mOmqYQMHUAaZl8wOMXUGclqkprPHVxyoCiP4MXbvcFG9gUHxs/o7W89
	 vuYz5Zx2EcELzIQFEa8ZahrWUwEDOMJuy/y85zUZ5EgJvdoKPHOHlrbkQcq6RehItw9FH
	 DWxVcAEJsQE58x3GRSqXmReIY0puY7Gi6UBxMTuYRiEk51rY1afVmGTcEKIbmpCBOmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GHpqSwXi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CyiMSSgP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8D5606A328
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 12:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB8D5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GHpqSwXi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CyiMSSgP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tQb8406617
	for <linux-remoteproc@vger.kernel.org>; Thu, 5 Nov 2026 12:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2k+6/IDNmT6SFeMIneO9S
	pU+2c9mLn7ihon2BlbEuM=; b=GHpqSwXiOFD9Cncjs1+KU8bYoFnoGL1BUoF2pR
	5vf4ZFTQ66Cx0hFbne37L7oWVKd2Tnqj6vIMy9F8H9ITx5ett+1xYT2NkwcLQclQ
	8hmskIY5ESqkLAF+HFDzlyvHO5gfKoSGT3N5dHnRucJSetUgtUIqGNo/KbUwpsIj
	ew2zhZKNe3ZH+/RUX0Owif7vFct1ccW4q6SwYVgQxUOR7vf38jI/H9+/y17Hb4cq
	wNUhu1Ov/6kZXgbkDQ7r+9u9x2qVKtjUGE5PIbVTSRM9Ew3yAyKnGdYd2zk8RM1E
	oLAp2i9XT3sUpEAYimptdcBumwF57vk+XwAgjZ0xGWC066Hg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v1hda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 12:31:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1750547a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 04:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793881894; x=1794486694; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s2k+6/IDNmT6SFeMIneO9SpU+2c9mLn7ihon2BlbEuM=;
        b=CyiMSSgPgLhYHRWi6Pm+pcfbh3MOe1Wte5C3YcxPwqmOwsoNTnMmNU+N/jivN1lOCz
         5uzHGW4hShPamrM8vjQZU4hb/+lwDqMwYtbcJR/ooQC7rNSbHzpPyp8znA6n09IOvtqM
         osE0LsuLXi/LM+ftEWWhoxVwn9G3ULHuivVUlydPdzpDVAr0qZTnXE9exdIqaevqkuxa
         PEdHeGTKVYdy3l9jsqsAo4BnQcQ1rB1ZaqEAOmBQi0h/9qNCi8akLiHCm5kmEK5rrcuK
         jd2XNtaSsGO1AYdPrbixf9g2Ss8peSxzmX1fOr666jGUVcgGOU3SsUyHA6JG1tAldREL
         9Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881894; x=1794486694;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s2k+6/IDNmT6SFeMIneO9SpU+2c9mLn7ihon2BlbEuM=;
        b=zrljsE7DjehFRwtfloyPOCvgoOGas9fdnj+Y+SZT+pAz+mHrjh8H4jT0kLs632Mj4M
         f3Pnc9yAzjBwrq5HOyF17w0EUnoJeGf8kFP21gCJDe/w9p9LqIfNf7TFW3rN1gZwWJ/p
         o0TVpvD5otC9l8ViathLgOTX2UikEFyVQK90yk18wy/wvfDQiNEqyoCXKlGnb3m28Qz+
         oRvJgwT2LO9Ol6lThO/SjBYi6SsaeNM3D9RaXw8W/bR6mKCQMUQ9uoTZBl9fL9ZKVxMF
         vWdVjOKx0BbOtRjOrqz5zy56o6zn9OSFGWECsxUlMikfo7WVBwBRjQemwINy+13NUYzv
         vF+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfCQyrrHVlfIQaF0lJI8IRPINPN7zO3BmYqqR+nuAvuUi5GeFdIBHuqMumZNO1PtWlu0HqaNMGfOzeazd6IAZB@vger.kernel.org
X-Gm-Message-State: APuU4Z+hDw244+/7fU3IfPmqTzDvLDRROVGbh5HOpYuE89Be+fGZPDut
	72qeC51min/SQt7FCiePkFSsAmcQZT+4iFWsgn5Ao9ULuSzNVKMdTk3EUCdabo71yL80baL1RJ0
	eVN0uS9Q1chKeG8257CyzzVzt6R+7NFUgXdbFffh8Q5f714eikROcKf1A3AHbNeV/Pvmatn8a
X-Gm-Gg: AYBFou3C7sGPgqgyuqYbbBZ62GLN2vOw7H1pz5dbs0zwtnyptqhGjqs53fwRXkvC58I
	VvYXBUtwDrnvG+lmV2pnrwfZ2CZPdAyLz8zVjeu9gfJCKsYPy7+bnb9NxIDMMIf5T3Rj57cORFY
	tjR6gwM497By5CwqFrVUspUHlVR52yhPPhREUi+MgKQeaTwyJRboOtV3wxTX7/kb4Nm8uksMWrD
	hS696EzjiCZdaAfovOmBDCJQ+HTSHpXVm+0IfitCC/X4+RVijF3izl/hTg1SQi/NhuE27bgoN5X
	3fDsUoVi0pq6oHPAR/z42Qycx0YnR/LFC4xxv3GHhNZAes9qkiD7oEAPIIxFYBNRTTlw6ZkAbyy
	GWZi+wr+c1ZKOqlML34pJ+XAZewtDHTpRxKTziU0wB6LQUJXhMp2+BEi3Nw3O1xvGsEzB4U4kz/
	ExmzdCgk5uUdw=
X-Received: by 2002:a17:90b:4a4a:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3ae897d313cmr15166544a91.48.1793881894491;
        Thu, 05 Nov 2026 04:31:34 -0800 (PST)
X-Received: by 2002:a17:90b:4a4a:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3ae897d313cmr15166513a91.48.1793881893960;
        Thu, 05 Nov 2026 04:31:33 -0800 (PST)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312cc44sm4186768a91.1.2026.11.05.04.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:31:32 -0800 (PST)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 18:01:27 +0530
Subject: [PATCH] remoteproc: qcom_wcnss: Clean up subdevices on probe
 failure
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
Message-Id: <20261105-b4-wcnss_unwind_send-v1-1-ad94209143da@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB537GoC/yXMQQ6CMBBG4auQWduEViXEqxhDaOcHxsVoOiAmh
 Ltbdfkt3tvIkAVGl2qjjJeYPLTAHypKU68jnHAxhTo03tdnF09uTWrWLbqKcmdQdjzwsY9AbAN
 TSZ8Zg7x/2+vtb1viHWn+vmjfPwiofix4AAAA
X-Change-ID: 20261105-b4-wcnss_unwind_send-dfd3abeeb82d
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793881890; l=2026;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=J71tadodfRGYJW5Nycr++mJmbgMQDs4uWDoXVUU2Y0M=;
 b=oWCm2r0F8KdbSL3/Mz39DDABOVzQqHowV1zzCmpf2CR8zdAItJDBHnMDVMug7TbWMT2hhEvIW
 RgM560kAdvWDJ8DIXl3bh6oGdp6xSdW4lq341ty8gHL+OeHMJdTP8vS
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfXz2XrJt3wzBGQ
 Sfj668bU5fK+kJUHzK4XAHyDr+YG9A8kINxjnuM8NAU3SWbqF5dSEo/UvtiaoQs9RgheU6nJ1NC
 tvt1Ju8nWcNCLNFexTAsAqTvJVe87Dk=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec7727 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wmpEfPDpJ3FsH4av_P0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfXzMbHCU5bI7++
 wjAi5D0QowPzX/JPb48enrCi/oLSTnrdzbztlIjyXKpGLmePRnAHc6sV34sPWWVBMz2oDzzuR3b
 uvMV6RTtTUji5Gt1MfcCLRS7mu4pCHfoo4y54XcSYYPnXOllELC25TJkHiJV67CVnV3DsY3NXMC
 6qc6O9wjqCHQaNZ23EdO87Q0EX3BE911RapWmQY1VNry3HEjBv1yM4/lYwNqJfjLyp1ifkxsvAi
 rCScuBwnuz/7OBgCWXFvU/XkYlKP2zVqa/HfivEgbRSQw+CoEt3sCQ/2xS/WrcV053x22E/n6cl
 Sjh030rHvN2dyi7PM8xZRl6N1vGNzmWsbcSHOg76FYkcDexMNpIA0lC4t7dzrPSwjaZDXAlN3L2
 g2KDsvLN483gRQuIoM7TtcIIQz/+hFfz2dpyb8g0T3AYc+mILIx8rcZl37Ltj6t522d3KPMFFdN
 T95RA1wsSXAy328zc5Q==
X-Proofpoint-GUID: 8sucMNvp_eN0Edaa4gsDDzJzWuKJgA7i
X-Proofpoint-ORIG-GUID: 8sucMNvp_eN0Edaa4gsDDzJzWuKJgA7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050049

wcnss_probe() registers the SMD and sysmon subdevices before the iris
probe and rproc_add(), but the error paths after them only release the
power domains. A failure there, such as a deferred probe of the iris
clock or regulators, leaves the SMD subdevice registered with its
smd-edge node reference held, and leaves the sysmon instance on the
global sysmon list.

Unwind in reverse order of registration. The sysmon failure path skips
qcom_remove_sysmon_subdev(), as wcnss->sysmon is an error pointer there.

Fixes: 5a856bc63ce9 ("remoteproc: wcnss: Bond SMD edge to remoteproc")
Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..f4847fb8f13b 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -653,13 +653,13 @@ static int wcnss_probe(struct platform_device *pdev)
 	wcnss->sysmon = qcom_add_sysmon_subdev(rproc, "wcnss", WCNSS_SSCTL_ID);
 	if (IS_ERR(wcnss->sysmon)) {
 		ret = PTR_ERR(wcnss->sysmon);
-		goto detach_pds;
+		goto remove_smd_subdev;
 	}
 
 	wcnss->iris = qcom_iris_probe(&pdev->dev, &wcnss->use_48mhz_xo);
 	if (IS_ERR(wcnss->iris)) {
 		ret = PTR_ERR(wcnss->iris);
-		goto detach_pds;
+		goto remove_sysmon_subdev;
 	}
 
 	ret = rproc_add(rproc);
@@ -670,6 +670,10 @@ static int wcnss_probe(struct platform_device *pdev)
 
 remove_iris:
 	qcom_iris_remove(wcnss->iris);
+remove_sysmon_subdev:
+	qcom_remove_sysmon_subdev(wcnss->sysmon);
+remove_smd_subdev:
+	qcom_remove_smd_subdev(rproc, &wcnss->smd_subdev);
 detach_pds:
 	wcnss_release_pds(wcnss);
 

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-b4-wcnss_unwind_send-dfd3abeeb82d

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

