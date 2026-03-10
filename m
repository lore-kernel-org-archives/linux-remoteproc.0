Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3563E92B5
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173941; cv=none; b=Ct61sLob+wj2BVWDcK1R9heZvtNuzQaTqphhLxVC8pOq+Jg/1VZE2zr33MCT7mIqhlYMyW04SYsjwjESpe8itwBguIS321CiJ1QeUu+iz2gB05XI/ok1kLeRJfJDeCxWRtOYjnpTMDCsVXgIQRKedtC8auxyrks7CpQxCr22qzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173941; c=relaxed/simple;
	bh=JjyaV+tgv5UDZXjq5MizMtlnFRKCCCj76Cp/0PM5tSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJoSsRTyZEhlZ3rcvvD3ZTuck72799esTvhtSltAOn0pAnKexSjAojruBKSHtkFXPWh3bYQyDu7PB0pz393MQqxpCSbHf/O6iVXDMGzNG1dWvXipKIJYdXa2ETDIbzK+R+P8EqDKkKg3PXAoidRf2Dcn+WsrhX0CxHOEa9IRSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXvMHFKq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7/neEOg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXvMHFKq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7/neEOg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIJ0JY3759641
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=; b=WXvMHFKq+20+1g7L
	oZQU641VdU9D+cbX6AIovAiQqEr5nAj6pMMuZPy3yOFt3Wt9bNablBID4RKL4D3g
	wg6x7qai8CZwzdERZf/AnCgVVCABZDxrhBm4+3Ud6c5AnhIjA2TA/UpstU/qGbWu
	+pWrTVu6616q2Wi4HqFtVl+AGsMqXRERL62sHA3SQOIXs9juL8KIHh/u2/Lju7rG
	M+R4VT/5h+i59gwg0bduxUeOpuKM3zoFr5pBjSK4hmThUnqHwHC5S41U3f010/Vm
	yRSEenFCQbwavL+2kM2e/Hcge38aLh71cAdRl44mye1AUAnxyt/RCCt0icuwO1YW
	INbz1w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8uhvx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:19:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829a6463afeso2461740b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173939; x=1773778739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=;
        b=c7/neEOgrsodjS2HuECUIxr23vrCrMYJlk8alfWeYYh//tzRp2PS5kZl5afBOATPgG
         ViGyUcZnlYjxUcteWO1LT1IuNGFtDGv1/ENkyiptl+niUMVy5U5awXKrJgS4nEcJX0fw
         XRxnk8mOV0NntsapoQ37sTjPe2oxwMJCcQGrZD3IKZBclBHoDu3Guc8cKms75ArOa144
         cozgDNGqtyjfmnIJpf3q/KgA869Ltry7+4zCRZSbPDWtS0MC68R2xcZs7h/CRD6lSp/k
         iXLbJL5IzaSWVC4lU5ebz7sgIoNuM3fNjp0kUN959rOuPcHiNL8GgXHhf3VEI7X4iJts
         FBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173939; x=1773778739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=;
        b=HA/BfGPTSx1AaP/xWrsPmbAyPwhw0ITVXqL0inbYpsEPw+DR6ggf5AAyvkc9yMEg2f
         bdofHoil93NHy8P575Aih+ChVvno4jpfOSRogkbh/y1BnvUiBTM9W/7zW4Wk3CYAcr5x
         E+TSWH3j88HS7Aeup1wYdFj89EiF0XMausAJLcXD+Bz7x2dDN6/DSVbOWoxyJIjaNTcU
         QcKraRRchpY0l2gAJMvSMaYE0UGJdQIilPEXOR6caO1IHebMgt8W4yUWeqRtBwpU9gQH
         9pFqL01itJa8RM9/LicMRuzAe45uyRhkzbbabX/e8mCrQ2oIZnPo1PQrKpqf3QDVJrY0
         HS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWU99gQFzc0AD+pctqXJs+4WRx1CD2qVahGSoHT6vUC9m5i4rcX77w0nUUfcT9BwaAS3pLqc84y1zaWX+jmFBWs@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXiIfvdlAgrw9ZjRr5fkgwoQH7U6yzzGrJauFY6grGpAXjzyR
	ZWQnSSKCyrjSnaNA17Qzxb2zhJ4lIoHGduD40NZniJoHXxpoWSdrVLm0SW9kIgJVEWD/wmetShk
	KirpkJ+e6Egj6QS6/SWZWzSzfJCBpUeq12r1AImKqXZ4B2hMQcwR31nI7849gW1ea1u4dYCkT
X-Gm-Gg: ATEYQzyl7D0OICorLfCqYSPU3t1idqxSCgtqrGlm0uR52Q2gg/JzmpdQx7qWBnLeIrW
	mWzJsQjSNxH93qbY8+9Qcb2oCynCyGSuD0yUMXTk3jZZrWbyNGe+6lLcy4P8wN1M5HhsLR/TrvU
	X7ghBfkO6EDsiO77cbv6xVy/6MWJOPkCbRr9+3q80NR1S0nEkeFqr80gBS/xNh295hS8Ri3DmmI
	lIwj2IlOnL6cPry42SURUS4ljx7/gGOEatu+We0O3xsA27ebahsNNCg7ZOF9/FZrvaJGz6K6b8b
	3A3EkS+nBPG4O4IAzfOzP9EWzM5DUFPVREzL6UjApV20QZ15tMMgx0wbG4pQcr8aVGFor/7Ngvm
	5/Z2jqqZq7Pb3KvfniYlzJPhWRJ8+zOh6hySDJpjnC1TwzMNd
X-Received: by 2002:a05:6a00:a208:b0:81f:852b:a934 with SMTP id d2e1a72fcca58-829f6ec4858mr185502b3a.24.1773173939253;
        Tue, 10 Mar 2026 13:18:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:a208:b0:81f:852b:a934 with SMTP id d2e1a72fcca58-829f6ec4858mr185434b3a.24.1773173938596;
        Tue, 10 Mar 2026 13:18:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:55 +0530
Subject: [PATCH v2 11/25] kernel/vmcore_info: Register dynamic information
 into meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-11-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1244;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=W0/rYOUIz9/ZCoXh44K186q/e3UtR3GkqMBkRm9T0k4=;
 b=ludxEbTdMls4VjiNy/QHAIk8/k+SgkzNMzSydpcQb8gVJ4uiMEuIbGBNqWIItJVo0Zf5Xkd+v
 kxXcoDDsIsOAhyrZZK7SX5Tg2/pa7IFWKbP5zQo7BszRJRELF9pecT6
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: izzyYwn_DBB-Ghw1zK7c0lnB7Qz9z1cW
X-Proofpoint-GUID: izzyYwn_DBB-Ghw1zK7c0lnB7Qz9z1cW
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b07cb4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6_paXCCOVaejlYIppVYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX+hJNzgUXx35M
 0B1jba5ey+UBocD9mpDNNg/9DmCRSiKQSHUvATJiDgY/SFi+2Woma3Z1fJA93cX1al9qEfFkH33
 8YG6/TsW01428dV+3QM3mfKhtu6jG4wXJj8HuTwv6rSkCIjORblqdMEVuOtiYBGh2SMKnd1lSzO
 3DNZkhRHv2/NiVKClzdTYXAkRqEXvh/VWLf9pvW+ISzHtMIiS2F6RxfyEdDHBma+l6FEMry4d4M
 w0Vt3abK4jUYHPqrOCzUOaXHcVKHkhrtZe4Cy3d4Fp4W3TcmMz2YjQvxGYJObe/vDrVXT26VLZu
 GuUfdlOkHlVc6Q5uyeNZ2WuA0rKwqS8bUsTXYNaFCLaWe2v3jkkXWFV0z6CjEY2W89T8+ORnQhI
 BkO14lcZo2WsAEdDRmXVm1N64RmHfi4ciLmCaJT5sR5pAcJ/2TpBOXOPWH9J0csOwouwCoK5axY
 VzjO6WZVsd1mF1a64/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Register vmcoreinfo information into inspection table. Because the size
of the info is computed after all entries are being added, there is no
point in registering the whole page, rather, call the inspection
registration once everything is in place with the right size. A second
reason is that the vmcoreinfo is added as a region inside the ELF
coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 94e4ef75b1b2..4ebb280dc38a 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -249,6 +250,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				  (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 

-- 
2.50.1

