Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B53E95BB
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174127; cv=none; b=GdZUCgdRs4dGNEuv1+m8aEPkOu9OlkVNDFsybfg7mZ1ieqmvY9zm+neL1KEkpL0ODFeY2fYhJWZFo95W2btHDuiMxkiif8+bClBYVq/INx7ufn5RPYTCsYqoWSVonfZEpqi4wifnZQDBkwxcj+zBb6qQ2HuW4bxC68KhzpNT2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174127; c=relaxed/simple;
	bh=wj+luXvDqOTuhru6DvwVtnX3t9V+pGkO1cWy33gHiXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpMxMwRGZlzjskSOmEabCZN8jqHuC4t6B6b2KUXNxHKdeF4Afrm3itevJ6wbFpx+omlX07r1EY7xyfJrT0XjYLz/95ptnC06JN5Q8bKS268GgfcELtFKbb27F1Eu/RaGsFUoDwifQ9L2aylW6ZMSy5NZ0cIX7qPcokWkHI4pnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSJh4uFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkGKb7cA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSJh4uFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkGKb7cA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHD1Wg1573154
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brkrGexervsDjeRqs9RzmRiixQVaocfEogoUtg08MW4=; b=YSJh4uFSvGRFmKbt
	xH++W5JgTe8Mvq0fGvsD2Y99YvKm3+U/JThznCK640M/4G1wZVGCwHZuJB5AL4uc
	BGdG2d5v0LPy05QsTa5J4pE91O5LS2IhS89xNVbJre3CaYQyhisVPdBrzA0Csrsf
	ch4dglNxZaJuU09OJoFN/NN/bZrojYcf+1p/WJ8VkvCTyRWoZfnLvhSr7kLf17QM
	MMnsMfF4h2wPWDlhwdbI84cesSWDUgqAj9pzWnJb+p16SotfK08GiYiZbRVt8sNd
	ckvjBYeQ1d4X6tW2894rVZYZgNXJ9STajqqZp56lAN+Eq/iY+76uyyg1rOD0XXbA
	cbB/LQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk8p89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:22:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8299499d582so15170868b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174123; x=1773778923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brkrGexervsDjeRqs9RzmRiixQVaocfEogoUtg08MW4=;
        b=IkGKb7cA6L+SM0btttu2n9BPmYXlhzQ5cYCiQxGbMlYBdZ0rAvl2cgh3Vy4NSueScH
         wl++0CyHSI9+AZtVWTQPHqweiF1fj2JhLopqZGTKKUVdaYyf7ioZB4H9ScSiAebWT03k
         OgvK3yXFyJ6YQJdKhTdyOcLlzOWeCL/nolrtXYGo9jE08OyT9CzhIzJ0FGy+KrHgNgQI
         3g8axPLjmQCZGTn1cCpVSFExlXEEFquuSG3bvDfIBmcayxkWRO5mfkV4xI7Zexo0/V1z
         APPTn3LkpSYzWlNEdyu8VjcONXu+hLa3zSH1j0YFHGBxNd+W1OUNq/3KJejfmILJv7wg
         ooKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174123; x=1773778923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brkrGexervsDjeRqs9RzmRiixQVaocfEogoUtg08MW4=;
        b=NyfTfjpZM8ZqEAJZmwGF7KDjQksggsvOodIGtm3iGCWEz1Kz3ua0TG6B+Eg7wbIonq
         NXSMACWwOr0L6UZWjmKqLHOvzdi2h3j65ry8IKF7Cp+FTw1W0A3rktFruzzqD6cSvb6Z
         B91HEv/JFpJUokeHtHjOSsGsWJNC25j7NPYNCpGSRW18GQCnJhexyvMGKPBQZjfiL6YS
         aTva/f2JM6kYFxHMnfdlIxnJ4upYXWhmRa+8R5USBCX8gUDA+TRqvsl8KVKxU5B8IeVp
         AvYeZx/iWjZf9Pvr/4+/zM9xe80H/t3nKenWSOyAjurwVqFgIMgi6qalk5RIoWBRGEwQ
         T6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK9smJ09BOGGfnuidhbOR+55JCnoZpxw56AOuZoVuvgfoQNSMn5TTQvf0sJRd8m0hvp6xxQnUuHU/P/rhZnuTt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/dx1KBPY/0y2PLPmpdvC1JAKOVwVa165A86mv1bd1ZsqMdbl
	MpexRc4zPNvmmexGmImLjjJf04TYua/cqKegp6dNB7fNMjkmNQGJ2+cVrl1WF/jv3QsrwW/Am90
	Gyky3WHtVyIM+3nhvmf6sm6e6fKUIDrOUc9lL8KtYi0Y3+TiwufeDjwoQGbWONFfbE3s9PO3r
X-Gm-Gg: ATEYQzzvWYTQBcTUXmvPbMBq5iSszjxM6Zjtf2z7yjOiwvsKgHVetypCVfBGgW/txTQ
	noRi0h9afOkGZhUworV0XGPrbcRq/3G7nkhi8eSHDof3yc+O9HCbQEaoHcDKsnfjgJ0bxPJxN8z
	XEvA8h2X34teNk7gOXabfXaPBml86PdWi6pdsuw8YEQeyubYrhhru54YcQ9QhD2XtYHK/iANhUf
	Fnn6hy/sB8nph2mKDgcLyErrP+e3NmO05Oj5HUbyKaobyc/U9aRuEodjx/yCqUU4WO0f1eSsmwi
	xOxx8teXm84FaR4z3mPZVCYAMErqlhQmRcdN+2RDeF4pME02Yb7f0NcmqYixmP2QY0VcJiTFRUx
	zAT7Xgt67p/T2dEvnVKP2ix1b0cYjn0WMgxcpY4OLrH8uMeZA
X-Received: by 2002:a05:6a00:3e17:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829f6f2abe6mr177052b3a.20.1773174123265;
        Tue, 10 Mar 2026 13:22:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e17:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829f6f2abe6mr176989b3a.20.1773174122629;
        Tue, 10 Mar 2026 13:22:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:22:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:07 +0530
Subject: [PATCH v2 23/25] soc: qcom: smem: Add minidump platform device
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-23-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=2191;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=I7h36vRINCl73eGOjCLTs1uEZfJpGZtYWsp4d/Eb0ng=;
 b=rMdSNPF/xiEgp7h/2PrlHDpbz9A7fwnRMH+HKK1W4eqdbkbtkF909spMFFFZNQ9yLATM6QiGz
 i5Npb95/nW8AU/UjvwC8S9P1wIPcyGpH6PiS6CA9GiFk8+2THVKvvef
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: bIbwP7hrZyvKNCB5J8Ybhih8Xa5HxirU
X-Proofpoint-ORIG-GUID: bIbwP7hrZyvKNCB5J8Ybhih8Xa5HxirU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX+cH/dXUa7Lui
 iTZyWmPdkK9hYHDVhQQRuTO5DK2W9o62ZA668ZMV754mxR/MJi4L8lvEVP0IDgPqgYHFY5rzTxT
 5NBOh7HFUgt3bkTeM5Vt5RtDrOjdyilqQAWQrt1sZL6lecAkeblgOsJegRvwsRrCw+q5ZgTsg2x
 kpXKu1lupPJebP+8uf6S8zcAcDHQxia9gthgOhBZAzQIw+W2CDMYTdeFke1WfCmyrk4u/QFr/d7
 yxAU8GFFv5buQueiYngIXCN0mmxd4jxvX2fdKo6dDyS+DBCUyAvwm3l3DXhObftphLrZ17w2q/Z
 9EzLbyZMLVFkEXWIgg2GTz9n35DbhbW+9bUTTxYBW0GKtBE66ilRAy+CxPHR3v9i2jeq2PxjNnD
 tkXLd+ULjNT/oi+yq6jhYB4sxz2LnfK4geq5PWXdxEKh+xMDbODYn/1i0z0LkbykI1nSbIi49eV
 u26uqocRvYgcQuizAUQ==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b07d6c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3CFpAjl5I9ltKDqHFfsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Minidump can collect various memory snippets using Qualcomm boot firmware
support. To determine which snippets should be collected, each snippet
must be registered by the kernel into a shared memory table managed by
the Qualcomm SMEM driver. To instantiate the minidump platform driver,
register its data using platform_device_register_data(). The minidump
driver will later probe the device and retrieve the required memory
snippets from the memory inspection table (meminspect).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..65d7b4d99677 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1242,12 +1244,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	/* Set to -EPROBE_DEFER to signal unprobed state */
 	__smem = ERR_PTR(-EPROBE_DEFER);

-- 
2.50.1

