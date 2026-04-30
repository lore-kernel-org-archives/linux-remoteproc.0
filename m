Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6B44CAD7
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576405; cv=none; b=VSV81ChLjyU5iJNng6hws9J0S2EMW4mHCGXemvjnIpxoZZkM6yBOxFqmZvDVgFwzPXOSi+FTSESscBE6A/d+DvzIJwgqc8r4xEErgrDC03TdHl//2NyXDNiutCnWqXaHUPIC8LkSFMB1LxfYTOmlYvqBdGUSs1hflTzy5Fvl7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576405; c=relaxed/simple;
	bh=4Aj46rPmBM5hQYPzWG3VyLR487m6blVFzHS1PuUL2wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ABZ+s2UQKJksmTZCGPokURsEUIJ1lhnxQ54twwzy3F2T2d8DMSlFdm2fuWLRCuOTzu7L2Fw93QEc7dP8CxYewdrqKal7uAPAprCgtjgqS+FXohBSzbV9H81P+YpcoZEOKuhCeP7l9MlqZP6PThg8xZMiNPQE2xVdveH448+e0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PE3einur; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhVCKfQw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PE3einur";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhVCKfQw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UGIUJW2121543
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zsCkvdytycFY2jGceriNG3
	8V1DET2f2OAEvmV/UYijM=; b=PE3einur1k4CmG9LYrJOXeOpi5wkV3yXVsOPUj
	KZvDVLIzDEQdyluQSIVGQCsGE1AKkRmsRYzjcgrzpK9zPyGsg1DFFhcabqxsSW9O
	CxrZu9xa1DtGCKmD4k1HGtRiF7DB811LnUw3kR8sllaoCbX3bamRRSVU3G8UOBIz
	qHqmARzxs8vJZS2SIylfY7gn1yjgk78nrgzqY6dF0rXg6R6Mnu7lxOA5mpUiY08v
	sU6kCyXIWyyEM6m5RhAXzaJaYuBfXfmYP5BNUnLN04KQQ6zpjLT71TJUaWwXA6io
	hIZXHyxdOa2UFHRDKJtvHoK8SJLQxd5Tz4zpkyR50GejvcPQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4rw97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82d40278103so859918b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576403; x=1778181203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsCkvdytycFY2jGceriNG38V1DET2f2OAEvmV/UYijM=;
        b=BhVCKfQw1k+1wqoJAtY90GG/YryTnp/TN44MQvdbaU1YVtUm3+2qKu2sIkItV2/tTg
         XfIVsNM4kyf6Xm+9tW5c1ZdOieqsNmUOXWT2b7qLlALWQVY5vE+YeYM/yJR4TehmJs0B
         i4sT0MZqH4o/0eXGWSJxE6tZ87BsR2kRH6mkK5kb2V0lpj3Pldihwtd21IJKeGN10PIx
         +yDzux9wKokA99hO+pckE7VcHgvE23O5y3Uddnr4Cpw9r2w9tv5CXdinkTgYaYRHHsS/
         uIb1GBiW7FY+9h3BIgi1QpH5DNCjisN5SSyfARK2CeXpfFNfraEgMNocW4s+UKI1yCjX
         htLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576403; x=1778181203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsCkvdytycFY2jGceriNG38V1DET2f2OAEvmV/UYijM=;
        b=Wj9pVr3yO38uDZGbOx0kyT/DM2a2mwYu4anxJIqy9jdBCVuYdyV8XpAU5vskDooCPc
         1wayVJBZeAEKEDnh/IeRDSfaxH1BTAJtMsUmctI3r9UJZLorj4OsdcPgshg16jkes94w
         v323yb6/liR3WhIHlqMxh1aw5+X1cBIUhcMoSIScnPdzuypEs0cjTvRVd7E5lJUNqa0a
         F2AT4JkB0s+Fd4VQjE/+W5xMIFvYJHL+hPw1Y4Vzl7kjnL0uarqKW3ZfCL1Frd+UCGXZ
         WLbWoukJMHqLi6HDMRx9VeMKSIOHvvfY9MxavD1AP0d1i6KXkIoOdrtZp0elWGeMNYOj
         wRDw==
X-Forwarded-Encrypted: i=1; AFNElJ9HARKKUVxyzwQcyQo9uI8xUwbm4eB2anxmegCarzUOmKpLcG04C8Hv2AVkeTtAafjzdw2p5OeizuxGfaRw8u2D@vger.kernel.org
X-Gm-Message-State: AOJu0YzXgDkOoiojsp1mikIRHfp8iIE/vaTAHFAuQhWQlaCXN9EMNhvB
	wkBdYLHMChHqGdsSEdz+wsQ3/lMSJdea+SU+S6blqvcz9aWZKgxRZYtGL52iCVl/jwZMHMDFmQ4
	ZeIO8NEWKHJX2gXahuQ4eTI9y5rvzdAdbkxfCIQ0TlNR9NWnNm+iUScA+K/VFisK7VjgwKOgf
X-Gm-Gg: AeBDies8jCbF59bu3FSna12dpgUqyGKYSHrFtmMEiC1Qx2mV90TW0Jj15dtVTl3bJyz
	Wo/mqR/vEQmHq2N/H/gpZ86byvOLQdBEja4QtU+oCIywsgZKFpyGBnf4su+onhGBesk/6dtEuWW
	Ubr6dKr3L3bO2WebKxhFm6aZDyPwzoLmJXQeEEpUcWcEhTG77mIwyEX709x/Y0TrvO3m5ail58c
	UVEQrPkl+fWMAkXEHUrdfixRfBtYj2FJ/48iNfMlDC1+B1OgPJX/ttW6snCDly4D7MM0i7imUiq
	BKjxjE+PfFPXFxpXsQrKF0OqU5D3vW4ypQO+BfRs3YAuJcH+6eTMqd3I8Z4ob2thxi3HUk4g2r0
	lCnMmKhg6fBhI9RQbNxRiFvYaj8APAIZ3W470HS92B036rdLx3mZMlb+/LuQ=
X-Received: by 2002:a05:6a00:1ca5:b0:82f:5154:d1d9 with SMTP id d2e1a72fcca58-834fdb07c68mr5252404b3a.6.1777576402998;
        Thu, 30 Apr 2026 12:13:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca5:b0:82f:5154:d1d9 with SMTP id d2e1a72fcca58-834fdb07c68mr5252361b3a.6.1777576402336;
        Thu, 30 Apr 2026 12:13:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 0/6] remoteproc: qcom: pas: Misc fixes
Date: Fri,  1 May 2026 00:42:47 +0530
Message-ID: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GD4ndSxxLdjo6I1jd0W3GvgyTLjdXeO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX6UDugYBzFpxi
 4dpec0AHnXk5y/Va0j35gF55eXyWGZaIIqBHRz/zfql6klExsuZX+mcR7K50CcsNO0TP8TKAobE
 MzYFrniQBpHjlLdeKauWbijlkrozYOKm13YK4AmVpSReQgFX7kIYrH3pvSJGMp6rYZlTRWdvgg8
 ZEZMnJ6LNnpzVWb2hx1LdCTEWjJrZNku1Ab+uLrUHm5LTFPsfSZkbM1hHO31bqYmr+JEk8Iv82C
 qHj7622Z0OWB/2l7e7mY1Bnw4fjGYEgNwuOlWxR4oC29CkVOrEIrZlywaKkkOHzWziemdpwqb/g
 RmT+PShTlMOSZLB/sEEiD406xx/kgSKF60l20ypMkfvRtghgvMEUNDYCTWZSbsTlZv18KKlHxU0
 InTP00HqBFX8S1BFRf+mENhz6t7B/6NX61N4yOvaWxjId1bjSrwS6C1UpvxET4S/giTbmRbcKox
 LmNJ13jMJIh1TQ8imKQ==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f3a9d3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C3U_2sOWQCZxbW6OCDkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: GD4ndSxxLdjo6I1jd0W3GvgyTLjdXeO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199

This series is a collection of misc fixes for the Qualcomm PAS remoteproc
driver and its supporting SCM/MDT loader infrastructure.

- Fix sparse __iomem warnings in qcom_adsp, qcom_pas and qcom_wcnss by
  annotating mem_region fields with __iomem and using __force at call sites.
- Guard the DTB metadata release in qcom_pas_load() with a dtb_pas_id check,
  consistent with all other release sites in the driver.
- Move PAS context allocation from probe into qcom_pas_alloc_memory_region()
  so the DTB context is only created for subsystems that actually use it.
- Map/unmap the subsystem memory region on demand around firmware load and
  coredump, avoiding potential XPU violations on EL2 platforms where the
  region may be handed off to the remote side.
- Drop the now-unused dtb_mem_region field from struct qcom_pas.
- Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
  buffer retention explicit rather than implicit.

Changes in v4:
 https://lore.kernel.org/lkml/20260331183957.2015440-1-mukesh.ojha@oss.qualcomm.com/
 https://lore.kernel.org/lkml/20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com/

 - Last series mistakenly divided two series cause laptop shutdown.
 - Some minor refactor common code rest is same a rebased on latest
   kernel.
 - Added new 6/6 to the series.

Mukesh Ojha (6):
  remoteproc: qcom: fix sparse warnings for __iomem annotated mem_region
  remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id
    check
  remoteproc: qcom: pas: Fix the PAS context creation placement
  remoteproc: qcom: pas: Map/unmap subsystem region before
    auth_and_reset
  remoteproc: qcom: pas: Drop unused dtb_mem_region field
  firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context

 drivers/firmware/qcom/qcom_scm.c       | 21 +++++-
 drivers/remoteproc/qcom_q6v5_adsp.c    |  6 +-
 drivers/remoteproc/qcom_q6v5_pas.c     | 99 +++++++++++++++-----------
 drivers/remoteproc/qcom_wcnss.c        |  6 +-
 drivers/soc/qcom/mdt_loader.c          | 18 +++--
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 include/linux/soc/qcom/mdt_loader.h    |  4 +-
 7 files changed, 99 insertions(+), 56 deletions(-)

-- 
2.53.0

