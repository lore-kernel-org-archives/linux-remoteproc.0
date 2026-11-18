Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016257;
	b=du7RDLXEEzqcuaEOi7EmqnNHgK0f4TzaAoCOSE4akXe/5JuVQeojVJgZh1Wz+H0nzTS4
	 +fzWLv9+16SZ2oAJGg9ME+XssWy7ULJ3KBim14sA2VksIGgDhnWoyJz44BwlPDx8Apg63
	 0MCaSBU/zLaxP6jEUJdaB9iVJZDqvtQb7CNZFf+fkZzUEqUwIWQtnHdaVTMBKo8IcqCGP
	 C0Gevd4Wl1Z7qSDS8WxNGdAxySOnkERrnFDtrDAQ8MeCCDrMUBMaITnkigkqBxm1dLbpl
	 ochTzeZsEFP8BvP1l7721k47HGGvMRyUi01kjrPO7G4HmBp061R0fjPURwR61qnj1jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
	b=qblia3/GxYW8ou2bokcsEWz9Qb/4ahZ+owgqaOxr+BOeCQ9/fhNkHvUnOPNzMwJeOZ2A
	 rMgbvuNonZR7qNnKFTw/cpx9d8OvemppbfdXwE77l8AYhSinmKkPdgDTPUrO05q/cwzbP
	 gwRW1z+CFptYYCCWCw7SVYAam0c5IFafAJ2jRrQhZBv6wzQAob26+gQERvu4dPHxN1aOl
	 fJt6OkqjqS6natTiELYMlMT6B1nCCGLBYMIiSgjJ1IOL1rIeeP4PCft9l5BHtyM+/LzX6
	 +KF7OdaAJFWJUcPo/n+JZ5mIzsGhCoZoUxo7RJKnzJJvI4bRt0sjoAdRfPgNDTgaFSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/CR0GMr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMcXPcL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AEC606A320
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AEC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/CR0GMr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMcXPcL0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQMv4633499
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E3TVw8XJ6Rg5jWJLudhPiQ
	Z/2xLyIljqKLMLiG7k+vI=; b=X/CR0GMro5+Da6Ax6Osuc6gXXRvITTq8xDucFC
	YBi4kZsTDQUiMgT/0m3sbVbCajChLRpA4N7lD1WN+dkVVPXlF+m0vTZQem6XbMXB
	yUmAB7mnmcWS8INQhLVigfxHU9oW97PbdSWxFgO+5X5p8CO+3FTHmIU/Ytqd/P/R
	ZbCsyCHwtGWiAqqy3U7uDgeLIEabFjLrxiQuWKEPSWrq7ipwCgJTWghD5kmFJQmp
	QNZheCfc8ofLgOJgudyNvCno4ExJsBSjxxSQ8Wfe/hkLZYa1605kvaBFMB0L2lOi
	KRYK/GJqVK8aJO0mEXquzIcb7LCMBVjS93XjOiykPxy9LKTA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8upxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91256a7b7b3so14980896d6.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016255; x=1795621055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
        b=gMcXPcL0AbAkUDKCs5qkEaRp0EVX6Jzau8tQuK+p89HDqQYRmhwlJpZ0fEQIK8jd1x
         RS1wsKEHyPVw4u4kWYPFHURmnh0Geq0YjVBvYiymG0j2dGOEYdQTmZphKi+vegkT/LZ7
         ZG5AybP+GdWsSngcjXdQgwdoxC3yjhXdNxonRX6nAadk6csKdwVS/Ur+3Ls8up9d8fYW
         YaV3X3C7R7OpXaOVJTZIv2gBT2FT7SDZl51kK+Sroz9IJ6KirJor6jUG7HzzvsGYtLxw
         yM1SQn7xHE8wT2stzd2SCHw/+KXUZqTiNlNi2T/fbeauvTzWh6S830a4kR4+b6hLDtBd
         HgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016255; x=1795621055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
        b=0jnGbpNASnwxpTOYhwy2Z3h3rc00+6uz90QXTrH3tIww6pqWLvkRDhNtLsgUzxDBWm
         GTT0vVu6xN9ffP/1SLW38Q42lmYX3MfjpnhHGrmY2oHpsU/OAqqs8rbOygJCR38Sg6j9
         jETndx3t1y+QBsR88zkuh2K6eYk0VnYFcSGio7VAw531e18k2nihMuDmR4seuNFydQG8
         XfOrM73bxU5X+7VM1jIccDaTpYq82W8oaUVpBJCk/yBferce63N4gGg+uMKVuyd6UnkD
         We54Wdc6f8b9aobImeB5BATNzi9bYjxN/D4hjTmiOmWOjkTt6ohTOTiRAwJDlp14GRaf
         iHpw==
X-Forwarded-Encrypted: i=1; AL+hErFIvqBAS+gTm+LJg0aepjrlV6b1VLruTsoWG8f28oQWUpg+fR00GYcLJkEc21LvmxSibFk9KRdbG18kd89pWXYh@vger.kernel.org
X-Gm-Message-State: APuU4Z8rqFlUYfqytf6D7850MVywZRMs0oSs+IlxgDgCd4zDlzwBXSvT
	HRXf4lmIGv4tNTagxCo7Q7vFEzBMwGgGKm8rQ3udR5MA/40wDR4PM69wJmuNdNbMn681MiMzWus
	eVF/gM9Vvje/XM49v+wodPvGKo0bu384rTg4Gc+qL16y29OPgSETOMNeHf/zYB2VvtwwM7byOCc
	XhuPoF
X-Gm-Gg: AZFdTZdYZh++CxzxYM5DyXMEtqbIGDQWJNdaDq0jQzF2oO5yF1JZjITrb4kP0nWu3n8
	ondLxdIh/P/aNf0v36Va4HlSh7OOXWuAwg9yEYVzqY/AwBXvWHNMMmlI9tGHwYD44bc2Y7Xis29
	dthwCDbnf322okRf7xcCeiq3q9jZJJLMplioYFml2FHz3PCu5KH7nR1JCE1eJgLoARV0NtlSgxy
	ohosUWqtYjwC8pKdsBAxsqPjRJNzOxc+EXtrDylndERNIM+GzTcC3VrcM6IVFkB+hYtLZM3YLzl
	R650l5KPyZGmgvjt2UTkTi3WHHNmNiGXzo896kEEUVv2fb+ExP8A8QsWDAENjBQ9dhZwOlCLjTM
	vxBLnmDmwE9IpGIiuKVJAOt1P+CmGAXmxDmGEsva6t/sVbAqglW1vkovjgFkdy7JlkbNaLHOTpR
	7YXyk1V1/fNfQk5tBH0ABWCxGraqNdTs11on6jV05g1yn8m0JR+y8OIiTcZ341
X-Received: by 2002:ad4:5de3:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-92114e9e201mr45357876d6.54.1795016255353;
        Wed, 18 Nov 2026 07:37:35 -0800 (PST)
X-Received: by 2002:ad4:5de3:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-92114e9e201mr45357196d6.54.1795016254790;
        Wed, 18 Nov 2026 07:37:34 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:34 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add Glymur OOBMSS support
Date: Wed, 18 Nov 2026 21:06:41 +0530
Message-Id: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAnG/WoC/22Nyw6DIBQFf6VhXQwPUemq/9F0gTyURsWCkhrjv
 xftpgs3N5nk3JkVBO2tDuB2WYHX0QbrhgT0egGyFUOjoVWJAUGkQJxQ6FwNwzyOzk+w6ZZ+9lB
 wnjPBKKlqCdLj6LWxn0P6eP44zPVLy2k37YvWhsn55ahGvO+OAEaInwUihgjyQsrKGCm1oncXQ
 vaeRSdd32fpgL0TyZ8Js1MTSaYSs5wyw4hS5Ylp27YvcjrRIRcBAAA=
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=4276;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=sFemIgyzO9lvPSe4UIL08ftNFBoZLUN3QQqRlbQQp5Y=;
 b=1ozoYVmO6bY6Fs5ARJ2bx6yNupGqbXe3ZChbQtawMvzHdate8Qoq2G9NXzPPzUhKVBuSETj1W
 xHSEBnMjKtxB5Dn3azS9pgjEhQ+mQZRin/da7Gghg90WhXw2L2XU9Ep
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afdc640 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=cAW_sDYG8GF9HDSd8bgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: V985txd4evkDjAls70eSf0qTlMRVz_rr
X-Proofpoint-ORIG-GUID: V985txd4evkDjAls70eSf0qTlMRVz_rr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX2ErR7NyEhc59
 hAfv0vpQcCyvdYuiFGeDPVgF/ML64PS9qKbfnrnFS24HcJ3bzbyo1QeQjMKNNuqolpd2jNqk+OZ
 o5cuPSkYnwwlTqw02Ltaod5SL3hPl4DhoseIPjYHiljPLEJBXOxafStM8Cm0YAZt55cobHdi/uj
 Ce2L6J9n541vTcnhLWclKg/IvUK53RUyo9tygGjwRNSPO2EBBRNJxWdDhp1faPKOJOnXAmBFc9u
 qHpeF/+LX5l07He8qDuLGPG+TnixQyM+Fb5fV8T+aqkAMoA2JaJglcxCO+0IwUc2tAM4gY4bJAO
 rdg7GcSwrxQW0DlJ1quyb1q5+8AI9xexMTIW0sBY4eBYmW/Yy9CWksYxNJUD/diHRtAbz5u3gku
 T4QI5TpVJZuhK+DUvDv0Jo4JR/BnBQLEzOy/uD21i1XFiDw1XEJjVHkuSSGcTpBm6DE5560ZwEX
 9nBgBjUZRCZJzMaKsgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXxIqDTF2ujXH5
 ykDgUtH5KBSiG5VYbtYpslEeABwaxFSNsTT6R5zOUcnHLm1PG6ZeaYJw9anIZ4Y1ICDPHZb1H40
 gg212YRLTm1VrieLh31MsKXZ4xfJCFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180062

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, Glymur-specific PAS parameters, and coredump support
for PAS remoteprocs with secondary processors.

The OOB diagnostic path also requires Diag Router support in userspace.
The related open-source work is available at:
https://github.com/linux-msm/diag/pull/26

---
Changes in v3:
- Release auxiliary firmware after loading and on start failure paths.
- Shut down the secondary firmware and DTB before the primary firmware and DTB.
- Allocate DTB and secondary PAS contexts independently.
- Continue primary coredump collection if secondary mapping fails.
- Register dump segments from firmware images instead of whole
  carveouts.
- Move secondary dump-segment registration from probe to firmware loading.
- Map PAS regions only during collection and unmap them afterward.
- Place the Glymur OOBMSS PAS entry before the Glymur SOCCP entry.
- Add Reviewed-by tags.
- Rebase on v7.4-rc3
- Link to v2: https://patch.msgid.link/20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com

Changes in v2:
- Drop the redundant “binding” from the subject.
- Rename the binding file to match the compatible.
- Remove the IPCC definitions and invocation from the example.
- Make the coredump commit generic for PAS remoteprocs with secondary
  processors.
- Shut down authenticated auxiliary processors before unmapping carveouts
  on start failure.
- Release TrustZone metadata on all MDT load failure paths.
- Assign secondary PAS IDs only when the corresponding firmware names are
  available.
- Keep PAS carveout mappings active while coredump and debugfs trace
  readers access remoteproc memory, avoiding a use-after-unmap race.
- Support coredumps for relocatable PAS firmware.
- Free registered dump segments when removing the remoteproc.
- Move the Glymur OOBMSS PAS parameters patch to the end of the series.
- Link to v1: https://patch.msgid.link/20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add coredump support for secondary processors
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 358 +++++++++++++++++++--
 2 files changed, 477 insertions(+), 35 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

