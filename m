Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A074279E2
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097572; cv=none; b=G8mDeZ0qDOnWUUcf/5oWbMOx7gqPJQG3uSYjP9T7UT3jaHPlnZMlBi85GraFhcJoCeQZfcc540QIVBZjMrdVaVhMf9uDJAxdNThRPXi92OrDkWmArMgsZLCFeozrDwK6Bh7ifdW6XSQq/rgFmprW+uI9WRoqFONC5sAj5lOBbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097572; c=relaxed/simple;
	bh=JA1Emk2GOGrNm0wBvip1tqJqrJtVwNB/O0vGeFWX/84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=soaVVqU0RDqI7riacVi5bzdPxkDuIhkMUVQBiuWAg0uFqn5ut0DZBEmTjBzJGmL045TYFCAOHg/42rtVFmIo6ESJPPDScKIcJ2uePCyhGCejeeYogOZkyad7XqrVsTuETCrEctIYIB+SKse7vM0HDIcyWBAMl1CKAEaOuDER++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cR9bULr3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8XOX31C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cR9bULr3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8XOX31C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC1Pb2427925
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v2mAeI36jMe
	fxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=cR9bULr3HuHIdluNoBJGFv+4inn
	oEkch/dAK8iHZXChBmP5YbxIOSs9RppPQ3TOJwqxNc6KjUG44l0NGpnP6kv+bW+n
	93OhKIOseaCH6RpcaT4bQYVVTt2zIv9g1XXzGixEOaqkG8xPAETVQCoustms+8/l
	1XL6XKajpsOZ7fXoIessDCYomEMqLT1Sx6X3lbhM3jZxWSOKB3YGmGnJ74qcBg4q
	AsE7BsGsPW2E1XJkUAqbhWuTQ8OdZtuPblMct+hrtcMMvkjsLExjzi9rEA4GjGOg
	PXDfBsHsJPiT4nYN8l0FHvpiUBgWVuZ9EIQhJ32d6/k+OSx5hXtL/yADkxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eks933-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:06:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50333a8184aso970326411cf.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097565; x=1773702365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=g8XOX31CxcmXx766z2IReF1IJvIswtIf5plLemO9Y8QXZHkKlFmlhiDNpl3v5o3+zZ
         SC6yDf7u8KyhpmeWRkL8KN4vIbavmu8TGnR/wapjh5/wN8uzqXrkiSfAypXpIjl2LpMH
         NhsYyx9v41ITpBZ9SLwd+I17SaxI1b8VPt1/JaSsnbFLGbE8Mmiacpd/ru8KB0+GiOyG
         6yQtx+vxXwnTukAkBwhS/jqXA+tCa0MTrStzdmLlXk2bZxumm07HAYvqA/NTEo2tv1H4
         gS78ZaphzaKzKMKq6AYNYL4ZJRp4iFJFFoWeO27TWz58d4JoCaJxtoaQHqJiZXruBvL5
         vsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097565; x=1773702365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=ltfw2kCCMygAwAxJXJw9u5Qt0N+kKUBHIuTotFJOiiJ8r8C0EwryboY8vMkwFAuGQl
         qQqLKY54rdPrZllyko3pAN9k9OBm11MqAjzHByTD1ljYh67hgaf6FOVmlIxDOlXugYaP
         N36yjlMfbOHzZ/ga4sMxYP9ER6K6f0owFu8GkD7D4BBnLjRDo/dPyAN+Bx3WWPj1kvGS
         RQwBqsv7aBfz9q+eJO7Q8HNiheJ3Se7NIkXipUXZ/ug3U6Uad66UNYXYkpYkJTLgOmbD
         6pWXrAmRomJVSx7P4pzkAqrKYelGU7DxADL809yure5SC3vrphjo22sgUoeMAjmqF+sE
         RNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcHmQRehpfxePSywHlQSwOKwOZX5K7zfOwknTdhycAJDdKJPmX8lqeOX1dTIXo7y5ClMZtO2Y0FvkqXYAGhPmX@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbaPvMgXjkO8E0D+hAGle0sFs+sdkOJYllKyJ8D3RUtiTg5UW
	XMbZhzQ1ac5HM1QjVpoNSkRjAZuCkJt9HrqYNzq1lm4dIO1T/TIVqfNIHwglkeLkSH0OFcht0o7
	uC/+k4L5i1zrMwBx9AriT1rHdEMZ8sSstWB4nNSdJUhqwxXFollm+HnBarakQCls/gTNajU+B
X-Gm-Gg: ATEYQzzcHRs4eiHOk68w2mtquVLEU+qqjYIsn8oDsPyp2F49R3lJy8wQ4DISl0ZXCoo
	N3Ze8wD7Jz0h+RPfjOtzpPkX/Z9ikI5JduWqK6VJiNdpT1SY3w7S4yYqX+FOqenfXljL/Ocx7g6
	cSX30rX3wXtOWWOMrjBtlai5b4wrCKk3DY3xbEwh/SK9UsNa7YLD+rs4w/PxyltXb3eT7KWOQ8y
	FoyN425NqlX8AHmzLeMwh/rTXWJdXzp6XNlM8BH0S0ivf5WaGoCkvhbD8V9Rl3wt7xODOs81VTB
	Ldw1xvxdrtEvULYI8At7EsPZbRaV6pGBwdghG6yhqIJ1q3F7yvH9qx6eaPvsPKX+8EosttAM1hG
	puBZOjdWEWJjm/VSBHG0ELF1C/4bQyA4n4v8Q/VpUWmg6LlR/pA==
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770645585a.2.1773097564725;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770640485a.2.1773097564261;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
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
Subject: [PATCH v1 8/8] samples: qmi: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:37 +0100
Message-ID: <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4jkDGCrtOI60jftjH1KN3QewgC0_mUEe
X-Proofpoint-ORIG-GUID: 4jkDGCrtOI60jftjH1KN3QewgC0_mUEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX+StHP/gxkl25
 VqjnLBT924zWRyKMV6e1I0HRxt3AqKDskK1X2WnZ2I8egojaJVkjn823mzfDL5nhPFq1lavO6EI
 q+0jIgB0txdbXepe+T4gaV+grk7YVesoKCd/ohPQR40Q/AjW8LRYPkta2UiAJdlVd9gASP4yf/H
 05AlsnsHcSUH93OWxOuRqG3NaknQt1QR6gmqqWD/bGMAO8DoY/bOCLeVYJsepDc1oILedsCT4RJ
 76Ks0ldfK8n1fIkT1kYfI6af5FTH/YxNvzGpbgm0A/unTJMN6E9KbHjO4kbtg7HZXyPUWEXucBv
 2GdtM1/eWmK5uC6e+kyLxyMXGj1Q5BIYmsCInc4s4K9/nRwMOLPRas61JE+pvANOHNp3uCnDXPn
 V9srZ3TIfbeYdswC4CixEZ88MH+f437A3ZooWf1NvVMVbcq9xqzjuECRYbCKQ4bZF02G4yFW/AB
 J/KqcNYo5mREJ7UHfVQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af525d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=RE031ben1CQMdFOqpmIA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 samples/qmi/qmi_sample_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/qmi/qmi_sample_client.c b/samples/qmi/qmi_sample_client.c
index d1814582319b..247ec5e54c4f 100644
--- a/samples/qmi/qmi_sample_client.c
+++ b/samples/qmi/qmi_sample_client.c
@@ -592,7 +592,7 @@ static int qmi_sample_init(void)
 	if (ret < 0)
 		goto err_unregister_driver;
 
-	qmi_add_lookup(&lookup_client, 15, 0, 0);
+	qmi_add_lookup(&lookup_client, QMI_SERVICE_ID_TEST, 0, 0);
 
 	return 0;
 
-- 
2.43.0

