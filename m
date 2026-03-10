Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB692313E32
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141770; cv=none; b=Dz6Fzr+ZyLbdTaIDtwDM2CDpq1HdrI5l1rPrRhNK1+UJxosgKHN0OcUTNHYzg8/r/VbnXYKEyI+cR4CQcCYbOQI4mwexPC4AFmKB/tC1MvLd6vHxBlsBJYUYMRIl9fpPzg+CW2GRWDt1CmRWyWiPUnEyuXNpabyiXaTS7H1tdgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141770; c=relaxed/simple;
	bh=/pYcuf75vG0mfIhpRZR934R9rutW2Spwx/s55qT/NGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kuvsqfdN+aOM3qcoYit/l2E0L1W1lvmlOsjDcp5TRUuvGvZR3Toht4gc+tkRdvbkMY8BJeDzfDdCfhM0n1V8CjZGMfvzGVHb9zL3ZK07PycL2/4rM0vWdnW8Cg4kCw8Ur/xzzNoOTjJfI3xsfqh8fSTYmlY7v+K/RETtMXelutU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvNdvUYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTKRWggq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvNdvUYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTKRWggq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABHivp3244006
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y/qwFBVrh28l0ZkfnwX7cS
	s5swrg6QXLtTG7HCt/bKI=; b=lvNdvUYVrWfemxq61pdGbHF7drp9x+Bp8VAQNn
	3uVWzG/PYaJoffXDdLU5DovvKKcOOhI5R1dlSrBXucLfOrCdIDkbvnquMMzBJoZM
	/ZX3biQPyhWUB/C67MeeQMytvSEHXTynFaIJGmSD/Ul3PiviEbs1rYyyinB9FsKL
	c8DHwmkiMXNy1Q+SOLb2oeRQiotDRy4mlRSyvoXARrrPH0T+wR/iV8XNzONGazbg
	zFxvJd6TeWEvj+eUombbAf1uDY1rqmkeEpjlR3RadusEQvN5KuRlawCAv9yB+21s
	9zhg9xi0xrteftGP72y7xrl7n5v6QT1NP1Mf4N/afUEKnJOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja280ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd85e08fddso2001201685a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141766; x=1773746566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=cTKRWggqbIRt/fIqACXHeZoy6JzuLF34pxJlbnLYTZNE6xkezgKGbRUxYi68hVtGot
         qLe3Y+MRhwglYWs//cXxpavTeSOBZCEd3Pvv6vtpK9RVgUv9nUsvA9dMicfTYNjoMtgE
         PfI74j2rNBmYy6YbupiOjJDOq04n7yNLqmGd26qUFMWQuVNDzTmHzAmmL/PUu8Muo8w0
         v2cAzhI5Ao0gTlKYy92yCpn3R8YgLU6VZz6vxfgTyO0nUQVSqmjSVx+grRoMqnhMHRAo
         +gsVlMpRqvbnKgCbI8lbbsxHwAjcCIWZck5woZs0KmzLjXPacJ6wJUmYIVD67KqBY828
         hmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141766; x=1773746566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=vTsQ1JsTnYWMlpuJDXeoo2+g5CkoZdSYxrcGiNXJRh6A81JXOenK8EU9DNhHbUal62
         GNt8lo+9uoVfCNfEQs4RdE9rzbTrCh1h3QZDPY60N2frqvM+EtWicGzIu0uMSMTjN0Kn
         13rM2RoQAk24fpFESJVCL8Ya2v+SW8SY+pfDz6004yOjwWa/tf6YYumhTePX67mYYu4g
         BPGIYSxuYSnY1uSxgx2aV7IsaeKlEMid/IzECvJtR3vg0Xti7JAvlOZ0yTcHZaWbDD+2
         GUIS8mODQZ9d0RdfflD74SS/OQjqtvHHHYHtqWSVzke56Wr//m2QWZ6Nscv6YNOmYWZT
         AZXw==
X-Gm-Message-State: AOJu0Yx96Fm/wIvy9XDao9I9H66c6QtfYk6xFsIpF1Qy8Mg2QhC8loxV
	78iMZho0WGrXxx+dxO/Ohm+faPOba0hpq1YNck7Fbp9SYQvop0d6dzljdPrPyuwYfwjzKXvVuBr
	qLL5oWNonZtuEO0dMeWLDmc9Qn6H8aIGideuo2KKrq0YhH1ZvM5QPOcjEExMrwAbu2RiGc09m
X-Gm-Gg: ATEYQzzfJ8+6ozE2Vr2uz9BakTSGIW1x/OYpZ10sPA2+RsD6cqgNKZg88nkBrOHLlns
	91yJS1QCtVsuKk85grhWTvTY8OGYw3ezd6yvjZyB06PcfwTmEOk7NcL1F+PKaGo6OgeGZL7l/Oy
	smpT1W/k8zmae/lMni6uKxcp8nFMh37PvDtYpNluGdU1Y5gPT/mDaPZ6GH+GVTBAaOw1xn+PSyf
	T7UPX4/NHdFJ/hVFa9qsW5OkR8v70u8TijepBvZ/7jVCH/9h4Egp05ka75vZjI/z+jR/kz4uxXw
	jthqqaipuprjppmQ+sUb2GIieB7ptaJFZWYVjdux4y1v9NRfdfYkWjz0nUn/xLMI6vZxmOdNuhh
	+cZb8iLAjLgyewkTUPUYTMLs5M0g1wQkk+M9eCYZMnLvL
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356171185a.71.1773141766011;
        Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356168585a.71.1773141765602;
        Tue, 10 Mar 2026 04:22:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Date: Tue, 10 Mar 2026 12:22:34 +0100
Message-Id: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr+r2kC/32NTQ6CMBCFr0Jm7ZBO/Y0r72FYlHYKTaTFDhIN4
 e5WDuDmJd9L3vcWEM6BBa7VApnnICHFAnpXge1N7BiDKwxa6SPRXmEeB+lQODq0KcqEhjWdDPn
 WXTyU2ZjZh/emvDeF+yBTyp/tYaZf+0c2Eyq0LZE9szJKH25JpH6+zMOmYahLQLOu6xcm/Pn1t
 wAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pYcuf75vG0mfIhpRZR934R9rutW2Spwx/s55qT/NGM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/79dtIL0hoBUkby2F0NZwr71kJVJLTW5zNxt
 HtKoGbbYoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/QAKCRDBN2bmhouD
 15aeD/0VT/T+e0k9st+gQW6YoLj391NXIaXPNdoizXWVYj9/m8VnvPzI4yWwLMZsyS4/u61yLYq
 17S5OEBQH+HVgrvKu9pBPYqFSQritNf9G/0hvOt04+KwKqlJzlBO9QR/2B2woU52sh4zcJ6hWYY
 cUpbshSq0bZsyO0OipVEbiYeWj6PIt0zKKi+mlf4TxbWMlX6pOUb2tKHUU/0c9v0BRNf/fZdKEj
 FQsxLzPgtHel9lhGJfsXDg2fyRpH/lrDNJ242Qu33xAQHP9Qa7/vx0/2GstXZ4f78qygz08Ound
 vR5ygwsDxAy8TveduE6uUXwbcytKBb1TXVbZBLYPaT95ssmFWQw11DvI+HpeNfnv/liVxY8NMzf
 GRab+WoELSC56zeid4QTsbVDSutmUwUdpsgtLXWgIEsW7DrDVrB1BRWq72Lgx6/nP66q43Z/mXE
 iTvTtgSmIF/OBXILTMAI99Q0tWvUNO/lMEDhaXEa9dqguwcz41UvtSRGFQgJ1O0AKp/m9t0i3Cl
 udGIQbKOUUncPTAupcq2h4sVQqMTaVlhQTNRmuW+FKT609sOptOyTiiOpMILV+DV752BUVBuFVh
 cnQ9Lj4MqQkPwFzyRWkaOE3b/j6SL5bY2SOdbomLdssxtTYpemKhI/FdhWV3oSlwm7uXtOndqj3
 s6tshYhHpVQAJZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69afff06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vNCZscE_9IHIdu0JSTEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: jEjhIlpH_f3-mD2vbQQoEvQyjNsapQ-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfXxOmy874iqS8k
 FF4/G3vj6zJS3M4vjqqD5o0pzkD6HwWat8HxL8mvF0cAKBhqGvsGI4SHBc2FjxBY5IjsOdden5q
 06fqoOrkq4/sRZNAwj82Fg5ANFcJn9KTAEEhwL0Vscx4qX1wczjPMOtXAGlpY0FrLd3iDM6EXtx
 euu3BvfY94EKeLWKXczIPAa5gbv+7QDbn2aANX+0N0vdM2Z13OO0HOy9Ki4CfyGHuiH+ym2xmRv
 hgeXN4SFNOEb0Rs78m9xb9YLqrIH4BBsV80+3m/x2+Dx/umz3CS/A9r1lS2B+bme2+WY0xAatPI
 KFoseX8nnLa/axWi31XinMm71QUI+xX6pk//eixFd7Ru6uO1f01aO1imokOEFO36WYgBmWmQbHS
 kJ+EoebiwkGmzo7MElvWvGmHKwCP8r12OVCJc7i7DcXDj16ROMBl8JwzS6DuZ6oe/5CmTbYWqRE
 +Gud+Vas9JP8uF7P76Q==
X-Proofpoint-GUID: jEjhIlpH_f3-mD2vbQQoEvQyjNsapQ-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098

This got acks from Mathieu (remoteproc), but not from Bjorn about qcom
parts. I was hoping first patches could be picked 4 months ago removing
the dependencies and making things easier. This did not happen, so
Bjorn, please provide Ack so this can go via ASoC or please express your
preference of merging.

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Changes in v2:
- New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
- Rebase, add acks.
- Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 65 insertions(+), 56 deletions(-)
---
base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

