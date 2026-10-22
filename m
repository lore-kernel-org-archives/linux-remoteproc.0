Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680874;
	b=jMtcGDTtJfc/jyAUTbT8zNpJGVFDcYqNJJ3MQkiiKVOh6+S8uA8gNYGfoUv0LNCDA2Fs
	 o8zUClt8Xk8pAyQMwJGzA20JfCy2n5zuJGPAv/iMBYl1+1By/4+1DkrEwvrTTh65yEP4D
	 n/Ko3DgFgNoLgH8LTTsyxPZZ0eamrx01DjbStaTGuc0o1wr0zCZcRB/RgiHaRVp9EYCtc
	 PmD7lRk4TnpE1Jt4v5jpg07NzbX2QAK1Y65UMDqAi6FlhmFDp+IETdV2tDDTCp8eOIHt/
	 SUg9/tANTQtBnk0kpWM2KRcgcUGPOHCAsTAAqvDdA3FtX3hi+uqH3M3J2M/+yMZjPjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
	b=rjwpn717U6IKL2Crw14pnicWcblyziMbEu/yudKMy4/VmEFbMY3YAhzNWo+NVpSKJ2Cp
	 HiN9boqf9aN1PzA73hf3gk5zQNV1s367YWn8ERJvpXB0B8GI5yp6oSQ4YdVBO1MtTY0VB
	 3LLCUc2Xukj96E0tnTixeK44DfAvpil43KDLoAinkMGqzfosZllQkY+htjmYovWcak3cn
	 s8qsBFZMrXelgIf9Qv03MZmu1fgwgpj2bbplTS349TNUBgB5w+kObajktgVH1QkTiNJGj
	 +1M07zTDm1JbhBSW8Tdkbc7X0w/HH+S3lcRM1RA7mKlhNwZ+jbhiH6irXQy0yXNu1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FNu/nGsG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IBhFJD+R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA7606A31F
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 14:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FA7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FNu/nGsG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IBhFJD+R
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFCDU3048019
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 14:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeyVFsqCqVWi/yTiZu/t1r
	p7LlLuz+7A3YoONaVMHFI=; b=FNu/nGsGUGijxpOunvpAFg313nntuufV14mIIT
	limhirkmXmrBmRiwMvw88X0yLt8F3mvnvnMn7CGMJIS+DqODnB4qclY7195jk+Nd
	pX2tCdXY9juGiSVl9+xBVskQIpSN3mF0GCoHK3lhc1S/1gwlf10hpmcJXAA7KWjK
	kpcVpTskb1YQ9gzGVFlCRERPzQ69inOCwCpzrjTGZ5HxPF0zxyon0x69U0Wx6UnF
	5FkR0UAgWNCVxTdyeqvuuRl3ItquW0v6dNmHjNsBv5uo0cxj9OyF6ozYDeWf2fBd
	D2mJrINo9nwDH7SaTv+YThP1Jtm57LzImeRMatAIFS/A8aEA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bv9ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 14:54:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so378616eec.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792680871; x=1793285671; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
        b=IBhFJD+RqeqclMEX7pIpqrUS+jJBVwSZCY/LFxNaf5i1dACGbFRdSmyu5zoCLvZzSx
         W0mECvPoaIvUm3VEKHE/QzOfXFuuF2PuzjG0oj9hVkqa50/RSfNrqdsDAaXEL7csw17f
         EwTQtyYyXfbdB/Q2Fvt2cGQz8CNOcC/2OSU1y/mfBDVXnP3ucriJH9QrM/dhtvFAtSjj
         tQJJiaZvWiYVjyKXinds5f/Uy0vNUvtevNpfu7kgZmUFydDJZPFOGPOLcy4W6TY5AkdS
         mo3pBw5DHaQoY8+hcLVYFNBjQyHU8jEKarbYTxpt3P+pz0+RVIQvMJ2S8YMwc9PdnDXT
         ZtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680871; x=1793285671;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
        b=DPjZAVPj58R+08Eh4axQqbDN28+bKrOnq8oLsMo6g5sNQKw9DfXsunJHVe8lSjnluZ
         wN1ZZZ6d9XXSh9FEZgRjuevUQKJJZhT3qBCd/fxzhPkXr2MyQjTjzc3xV8igYndV6HG9
         2tmuimcpZIikys/l5VnZocO5dghw9Aowszv08bc7TV0YjSU/LKNpwhNRg0zSFfOuP4hB
         0Ie5yc5b92H/fhGxZivin1ZCFIWDS1U/SBOWLnbbEO79I1oo+chWapiZLZj8lLk4ng0j
         AYw/7R8uqkyppCGS7HsByrttotcez8HDPDJZNv9ybBQe4JfDDRbrC++2Vgkt0ApObnoe
         LZOw==
X-Forwarded-Encrypted: i=1; AKwUvBxmayxPGHx+QIuCWYt4AGLXwNPzSAgBtDLQiWAG9EWq4Mn5fFpHL9yF1x7RAuVRS+1Dd33r/2XKEzb3fZ5fO863@vger.kernel.org
X-Gm-Message-State: AFq9FYLSm+Co8RDVd7FEuf/esNkmWzPhA2+JvH2hQTETOf/nkHm1+Tyc
	+7m6Ac15uIdBNzwCL047j6zvTVL6F9paID8Y0iqhK/Ck79LwuM4eMDQJtWQhFo1mEBhYN2LG9Hm
	yY5O/mSwRWv6X1wswCGJfrgfAHvWhmoCnzTId4xaPa3p3PIQdMTVBSZELVULJ5khwdqWNgdpg
X-Gm-Gg: AYBFou3lKemHBsaa5JJarMZw1mnBFO9pSaHHc0ERYR6S5v6XO65P5zoueTJOtNFhYJ0
	koKmCHSWCQCIvDror6mlOP7zCYSxs0EEvNMQ82QhfLuJ5p8xt+l9u8+G6WHwtxOHDohqMpfEEjz
	/r+CXTyE+NyY65W4rtjPoztkRsOWX0uyYqpqgMXgZa/hfWOqdXYdk5/x5vLGI213wnARARBm0bV
	b7bP2v6wUBCxgUiQDiqNhIMyQf2qHXDUILBzdgR00p0PAgzvdWZcBIYx0kab+RQoa6T6XnM2mzU
	uoBAQrU8Sc79TFhIaP/PH8DdTPmCmL7YYPl8TCExLIg6CayeH8bKxIeEUr2zoAiSEVImzIRta80
	g3B+SO4LInB9t/llIDRAQy91WF4pzfaDlliLa
X-Received: by 2002:a05:7301:8615:b0:359:8492:20ff with SMTP id 5a478bee46e88-3674c43a7a8mr6978992eec.12.1792680871394;
        Thu, 22 Oct 2026 07:54:31 -0700 (PDT)
X-Received: by 2002:a05:7301:8615:b0:359:8492:20ff with SMTP id 5a478bee46e88-3674c43a7a8mr6978969eec.12.1792680870900;
        Thu, 22 Oct 2026 07:54:30 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bd2a6sm26250257eec.18.2026.10.22.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:54:30 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 20:24:25 +0530
Subject: [PATCH] remoteproc: qcom: pas: Release DTB firmware after load
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
Message-Id: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKAj2moC/yXM0QqCMBQG4FeRc91gG1OoV4kY2/G3FqW2oyWI7
 +6qy+/mW0mQE4RO1UoZ7yRp6AvMoSK+hf4Kldpisto2RlurolMvHp5+DOLbKfru4zMeCAJ1rNk
 43biawVSCMaNLyy8/X/6WOd7B03ekbdsBhcScl34AAAA=
X-Change-ID: 20261022-b4-qcom_pas_dtb_fw_release-95c140645cec
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792680867; l=1584;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=40dojUEYiTck5avIuh4BZLBGj7u3joSJCzFWspEillw=;
 b=HMYQhkmCsBufTsqpejcDU81i+XJ/9B031qiPCSbjZs8maM+zPlzrmJBFmkfKc+l0CN3jB4U1m
 iGFeS0C3y5/BwCarm9Ozo6DDo2U4cHbU3laE3PXpypjuIp5xiJveJQz
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-GUID: d83RlGt378qaA9owpEcSYFDvcrxuhVqd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX0DHOp6blGWi5
 hsY8RdWxkjz7mnZttseiP5YLQlLLhbZna+5S/k5oQrXHKN1XicTRsqku4dXf4APEbpjUxk/VtD3
 ldcxgofCBookiDmvJMa2AKzAsSb6Mqw=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada23a8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y1IhKJFcC3I6eYhxwIsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: d83RlGt378qaA9owpEcSYFDvcrxuhVqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX83K+sKqkJKzX
 vKLnIU2+laDpT6dqpnKT9AGnLSjvzlTQdzM3XNOzIcMHDjcs0habV37u32Q+T0vDEP3uQmTzEGW
 fzQFVFUjpiaGU6i9t+8y2GdocEOU5arUrwPxwRJemaGmKvToiPn/Qn+I+hGNM9+7CgQthRIeF6h
 ir9eC1vUVrN0wgmhMu2tlZnrm/HTJ5sBDAw3ry6EFuUOPV+v9RcdmFs1JKYblAGslbh6yuO1xh3
 0sZ+durkUuMa+LVN80dKi8Si5jhZQIbdty42ruK0C8AEyp+PbJBYVp7giLAbtmiFB5BQvsWyk56
 9E1RLOjIz7PE/ToCL4tQX6k0U2KbC/yyMnVuNsicFa4foRTr+3k8f8EaWIPNCFDhVQn6GeIT94w
 SYfcqCwfkFdSGz/xNYtHUBgxqch6JN8z9ivZS/3NbpdRhWLe77aBMFckrm9XW9H1f/im8GacVk3
 VbKcRFT+5O5vKxC9Y9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220059

qcom_pas_load() releases the DTB firmware only when
qcom_mdt_pas_load() fails. On success the firmware is never released,
so the DTB image stays allocated, and each later load leaks another
struct firmware and an extra reference to the shared firmware buffer.

The firmware is not needed once qcom_mdt_pas_load() returns, since the
metadata and segments have already been copied. Release it right after
the call, on both paths, and clear the pointer.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..2ac21c502d35 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -279,9 +279,10 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
 		if (ret) {
 			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
 			return ret;
 		}
 	}

---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261022-b4-qcom_pas_dtb_fw_release-95c140645cec

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

