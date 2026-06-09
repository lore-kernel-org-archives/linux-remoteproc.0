Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DF73F23B9
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000587; cv=none; b=qQBWgOqO/4JMu5c1aevUVM5XSmHN7VRBHaWPO1+n6jyH0hMBwEv3QIYsinJw6Ir7rQ0Bs+41cYgWFdZ38Br7RotpmhTD6j9Nzj9TENQzWEpURk6TuIDRK6GJOxUUxHqAP3ZejhKgM35oc+djUAfJn2s5C6y7pWPzYun+Se7gVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000587; c=relaxed/simple;
	bh=7x8beBIojNECtEqJiYHYHNuMd5/1w962WKF8Uqh9EuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=df9vjJFpjz0bvImvs6kBUoiezqBLiVlVbgwDZKYr22CLUCSENpPjdAdr0bFXzpM8/nRnl1JDkPNn9P+lZzJ9TbaNJONBi4+8TQrjRekHIcH3NoZ5wAe9EOuC7T8mTUeRqa1l//+5ApauL2X3qVcCUiz03f/OJ1DExz8UYzPpTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oK1vEgCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRZfMCua; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oK1vEgCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRZfMCua"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xYqA2320559
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oGapPqde/L8XcWbgwW8R8f
	ZSYz2OachDKg2LbyV/LTA=; b=oK1vEgCwMRWmWTdRU+YtNKprw5kl2WGsT2ZTwe
	5ysNuCmaARcWHlq04CnAsMhVuqEuScYuJIgau+RL6AS6T1/SNrn/O/UyGAMfOJDR
	li+aozatQnJUL1PC6/geZtl5VcqjrevGJgGaHFSP/4oWmJuOS8J/RZ9LcLmx0gBi
	153WJkDPROS5loJgNSnGBWA0pg14sY4Wm9XWcG3DkG/RTRFfRGewubj8wakRuAOd
	EGskiursJ4hUYqAFDAh7LYn5LAdx8OtLJld36oiQXlmXBBg5mRUv6nqxrdAAgoMA
	Za/KXn36Oai48YwPHXJ2oShYa9iZwIVkHNj/C6YI/WbFVrng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearq16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:23:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c272e532so55708805ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000583; x=1781605383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=MRZfMCuaSV1arBcw9hBblGd4J+vfcvOdLZ8nxYqbnosxFz5utSy7PEZsYkek2FTU76
         idk+dmG+W0WHfvl3Xl6Rk2wmLELpMDJbIbBsruBXtmpZoVDYk4VhWlWw+L8cjNXdX5te
         5/hIPubiyg77guhOoIfLvRPkys8u3yd9d/36I+uWDYUh/RtzYifHfd3Fz873cNoSsJXC
         hnHC0wV7YlFqYPdgyAkqSA6WBPFh3NaHkOVHnkoS99UZaM77oYa651l+5KeiDI5kRVxI
         BnnisIx5cfqkTZQQ2pIX+wyNi+hxb+w3jBO2U3uDV5L42/BH/q7taWiJN5jRFfU2Iq8m
         FEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000583; x=1781605383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=sc73CTTAKknP7iocsk1SS4LEftRptlAcr4NPWJTLei4Na7ox0jgXCcG3BNtOK3TeKI
         9QpL1KhVnq7sRBytvkcnqjZeXrR3L6nd89rcfG2maTAwCKIjJO1J7vbfgHLd1kBtU/5n
         75sHujH2v8im5+3LTVE8QeP3gPigycpRGcNDcSTXAOCf3OnMZbIWUC6BdzIxIHEZ9Gqt
         dkmqa6qXtLiIlOC/mqwNhRaSUl+eJCcWlx/qUtA4zk5YtZLlwsW7/+o/X6U0nTmZqKiD
         P4404fifuK/SOsjO5i9bAst+UDCWv+R1ty/0hBtwnG23SHKHElGt6ZykksvM9qn402zR
         P1xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+U30ssJHbEKYAzbQR6Y5MCV86qyUA0WhvbHGFoiRonnK9WcIt52IMao5fRfK9ucEtEoO8jOYh5SM0l4jWXshDB@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpKW6fawKTxDYOdx4n84Ib4puUSxNoqAMcwA+Pcs0pvE4oHhR
	ctnguSDF1fVl3m74+EPOdWriE9l5DMXgYVyTyAXrgoqZK1x/zg2JKLI26yYQEuWBPFAzZ6ByAI3
	rdl5CsDk0SHKN5optyjRRY18+ilRhMvWY3LcMEoRBfz+N92WU9PW2mKOxJb9RYeeDZL9UEUmR
X-Gm-Gg: Acq92OHJsoawGGiVgqrlMHYhUnkj2cJinih7ETjZaWZDnzfM5DtxyN+lrw/kbzUXe2k
	5K1VJv9NJx6PaD4qu0A8PNuuiH+p7wFRBfRgmH9LdjoEd0FCwMkKpFi/LV9MOfPcSgd2422v8vR
	NXNbFB3BVHi76Vk2QsgJYYPuFxaWMwenI9gRDOVQBUXOVq+SCTbyt5i0a+tbd5y+UKjmJVmfHxX
	oBBgQ3U+zilF8xQyuQpZ1MLlJ/AHvF9aAu4LfKlU56CyvQtaTF7o51Td860kYEJDTog+pE1fknp
	8cwEcpng3Ds2dxgLk+mTkp2xI0CIPOnlDounwl9OItlm2nD7B0EuMW+KQ6udspjYZxDpLEduXc1
	M9WDVVWRRIq2yo97q+qhKELJrZvssHEsB5RrsuCOSLh8MZFJA3S+FZBU8Q3k=
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207447055ad.6.1781000582761;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207446785ad.6.1781000582247;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/3] remoteproc: fix silent teardown failures and prevent SMMU faults on hung DSP
Date: Tue,  9 Jun 2026 15:52:50 +0530
Message-ID: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D5R-SVD6EoRJS016ymikyGlegTyH-NUB
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27e987 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=oORZlF2qDzti3-ymW0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NiBTYWx0ZWRfX0yY5GT3dX43I
 abVuM295zMon7MgUAxdgGFbgZPfzA7JCKYZIBoflPWChTeFh2h7ZE6ea1cBbpov3r1+Cko9dGhm
 sSU3o7iwPeX6EyFEQL0g//2l1WgVq7lss72Kc9WizigJrVpmaCtkKzO9PmTmOZvXp81J50AaFmx
 4Jr4WlNvIpp8hcsT0gQFHqCOFnJ403f1htaxw4Jon8h3yDVN+RE+PQLiqmnEoWiuH+v7QzA5blu
 1OQ0UccQ1ufseaZO3DxM2I71QJ1kCFuxxdctcpCqce8jI3LLPDQnJPG48C1gJehYaI1S9A9l1/y
 3mfZffr0kPfeGv0m22Eqx3Crni/KqEP8EpfwyZMetykAhWY6w0MV0j//CrKUp/vApJk6wlRLMP7
 qCHOiIC8/KBS0yvLo3r7q3HC6IqE7unylxK2/qDM4sVEK86uArGG4rysFxr5lT7oglSJB/s/gSh
 H7rQvuEsvK5cxAxgi8Q==
X-Proofpoint-GUID: D5R-SVD6EoRJS016ymikyGlegTyH-NUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090096

When a DSP hangs without triggering its own crash handler, a graceful
shutdown via sysmon times out.  Before this series, two things went
wrong:

  1. The stop() and unprepare() callbacks in struct rproc_subdev were
     void.  Implementations had no way to surface failures, and callers
     discarded any internal error state silently.

  2. Even if an error had been detectable, rproc_stop_subdevices() kept
     iterating after a failed stop.  This meant glink and ssr subdevices
     were torn down regardless, causing HLOS to unregister and unmap the
     shared memory regions.  If the remote still had DMA in flight
     against those regions — as is often the case with a hung DSP — the
     result was an SMMU fault.

This series fixes both problems in three steps.

Patch 1 changes stop() and unprepare() from void to int, matching
prepare() and start().  Most implementations gain a trivial return 0;
rproc_vdev_do_stop() now surfaces the error it was already computing.
Callers warn on failure but continue iterating (best-effort).

Patch 2 changes rproc_stop_subdevices() to abort and return error on the
first failing subdev, propagating through rproc_stop() and
__rproc_detach().

Patch 3 makes sysmon_stop() return -ETIMEDOUT when the remote does not
acknowledge a graceful shutdown request.  Combined with patch 2, this
prevents glink and ssr from unmapping shared memory against a hung DSP.

Mukesh Ojha (3):
  remoteproc: check return value of subdev stop and unprepare callbacks
  remoteproc: abort subdev stop sequence on first failure
  remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown

 drivers/remoteproc/qcom_common.c       | 26 ++++++++++++++-----
 drivers/remoteproc/qcom_sysmon.c       | 15 ++++++++---
 drivers/remoteproc/remoteproc_core.c   | 36 +++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_virtio.c |  4 ++-
 drivers/rpmsg/mtk_rpmsg.c              |  8 ++++--
 include/linux/remoteproc.h             |  4 +--
 6 files changed, 71 insertions(+), 22 deletions(-)

-- 
2.53.0

