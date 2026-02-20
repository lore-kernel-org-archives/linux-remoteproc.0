Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A552FF158
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771621917; cv=none; b=HGRQVGOy608Pr91nwkX9rvFVyTo/thyKN1F7le7x152r8jbCDmHAAD3F5ZNtknx5yFuIrDnxkfBxjaw3OFnv8kmWKM2uIrhFbJdL61+uxsGJcdwfpgeh3/lD6eeKT2jky7JtmWlLf1lnRJUpzs3yLKwLvCaUvG2uy43F9MzN1/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771621917; c=relaxed/simple;
	bh=DL3Sst52QBLUKYVj2tfLw4VHvR7JBJOofYsTrvCjkmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GdSHp4VWIHMk3lzwyLlK0KGgWkcbzIxTXN/BPJkeHixsPR4dLvtExNdPgd6e0Fa0JwUz1QpCdIxa22NXpynJNMziT6yhhYiVi7qT6iadGOTN3bA7C61AFaIlc1UN0IsvqXRBC3sHxBzWJCTvuijYZ8E5nCXxJbkjLEr/aUV4aFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoXX3Hni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5NRWW0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoXX3Hni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5NRWW0m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KHiA7x148457
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 21:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lfOBufkm7Z/MEMLOsm70W5
	SqD+HBjk/QRTlErPpYjdc=; b=DoXX3HnizvpTqr8dAqa4kd+pyvnGi9gZNfGj1W
	A8y8oBtuplWAzh3FNaKBzmYtHuEXQeswTcWLd//93MCl4oZhf5uvp8WMa1AmX/zD
	QF3EFeMiZhiWKSXCqU4OqD95iHLW9Cw6t4FMgBfnX/RLV8CAWLQCuaCVwLjU+T/e
	l5Lel6tfOED25DloTH4ZCdqHBKEISaohtdhfwOxqv8Wbqvb4O6qUoXW9t/e6AfKd
	+PpZbZUr4IwSkq0BimIpGj6rytKf3+RaRhNj5d2Rhe50mg72tf3yJsL3XoeLJzAq
	dAKUV5LiApyN7l9dmjNYsDnMjB8sfwHfhwcSwnE70QBu/eZw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cechhb1xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 21:11:55 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-66308f16ea1so28774686eaf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 13:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771621915; x=1772226715; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lfOBufkm7Z/MEMLOsm70W5SqD+HBjk/QRTlErPpYjdc=;
        b=P5NRWW0mnJZORvYIwvxdcoPpx/74TKmdiguG5Za18ZeW9fIzd8E3VfjRvWTPYQH8E3
         i4QOvhNfH3lNNBJFlcaBxe7gxICljAQU6v+QXnIBr8BAvajdaGCliF0BnWpqRlfSGEb3
         CT9TLtuLUxYdh7u9+OmRzJmMutOdWw83YOp2kBRJKT85y0uck9r4OdC3iHCYQbv9RPlc
         df7yE+daenwost3UkPp0rSKccyhHxnHGzJjgaRinrfT8cvcQsmNOvgEiGrGtNN6M1rXR
         8nNmqGYu5oxpWnLnAyB0bSqA2NaDf9kNd4jg5IK9eFgdc6TN49IIRgwRj9Oc5OXLF0xG
         zabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771621915; x=1772226715;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfOBufkm7Z/MEMLOsm70W5SqD+HBjk/QRTlErPpYjdc=;
        b=qBxqq4zhPZd3peDWxCQ6pcYziT+VuYgs62wXkRKt9c49VCSjRSMsLwfKajnVme3WYw
         OT87HQr00kiYT+V1jmFOLbGkA0HmLmxbTlqedl8nx9j12kXEgTD5OTrE09x65GuTt33K
         FEd09cPGAG79qwtLkH8onU27yFpMccoq+HjbSzALlOeBKFXyM3R7Z//QIZvhMESmul2b
         Mu6yf76OLRXJZVnZiG+xpSabQ6snW2+t5ACnB4zc3/Ki1fu+8BIPpi3VLVc+p+FYjh/S
         xiW4VtPAezP+KGi8bwbyVXTyw5bxGRV0o2cpdTj4+dT+M2zE6VKCkdSvQXXFl9/6O1vq
         weHA==
X-Forwarded-Encrypted: i=1; AJvYcCWffMDyf+SFEk/tYHaFabfHi6rbg5uD69/iDA2OoRhI+zCtbngg6hKN32UuwD3OBKsNkLjYGHLwI6xc9hfO2znO@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkMvJsnMjrSe0ATRFoopF8MMOrQX7RgrRWm2XLL6VirI6BTdF
	lIyLwX8qXD4DdbhkBKtALJEsZXtQvfWf0uxuC7VXuYFhzMyu38b/TQFcGAiNY+4gopP/Cl4To5V
	MRMWmEhcohYmH0PQ0B9yiPssyRHifM12swgSIlgtpwnPdLLdqr49MDOMGxVD6k632JZXSBKBA0b
	rUGFpR
X-Gm-Gg: AZuq6aJSsN8/42PZh+1osV1bsIqBNSigk0NfzUYi3GgbdC97dv9lAYYILHExXlMRLsj
	4/85sPcxFY0PelcrHEAm7C5N1mOuUBuY9Xt5i0EHaTFvgcElmi58PREQdVruJn+ec3MxOUYiDVf
	QUGiFP+BdzaKaoFEzVkxggVjP4fbE+h7vnNwlpAW1zch8hlCwAR9zbWH82JF5BuClmVYDt2FhIQ
	yq9RXc22bngoqKXB+YflkZQNGFU2+0hzTPVqXz5CS7ptdCueOaA3VRVW7KihDRqu2uwqbkKxMmM
	zvzHfUTtWzIYNSWMsJVAHdR/g/oin10UOEKGSnEp0NooPCZiK/eGL6Oh12a9lIuewWNwtwVOQUD
	7dbYlX9D8S4o+ne6DOoRLBOD7W1n6N/BbeBri4EJP1HzWGfg09FQp09HKIjkJYXOC1f8B79kqy9
	7Qlo39ah+X8hLHAGgmr9RF
X-Received: by 2002:a05:6820:228a:b0:66e:58f3:b4e9 with SMTP id 006d021491bc7-679c4507b4bmr742340eaf.67.1771621914722;
        Fri, 20 Feb 2026 13:11:54 -0800 (PST)
X-Received: by 2002:a05:6820:228a:b0:66e:58f3:b4e9 with SMTP id 006d021491bc7-679c4507b4bmr742329eaf.67.1771621914238;
        Fri, 20 Feb 2026 13:11:54 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c565728esm382227eaf.8.2026.02.20.13.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 13:11:53 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 15:11:48 -0600
Subject: [PATCH v2] remoteproc: sysmon: Correct subsys_name_len type in QMI
 request
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-qmi-encode-invalid-length-v2-1-5674be35ab29@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABPOmGkC/42NQQ6DIBREr2L+uhigam1XvUfjAuGrP1GoYEkbw
 91LPUE3k7yZzMwOAT1hgFuxg8dIgZzNIE8F6EnZERmZzCC5bLgUFVsXYmi1MzmxUc1k2Ix23CZ
 2FtyYuhZKtA3k/tPjQO9j+9Flnihszn+Oqyh+7j+rUTDOLi3XfYXXtufD3YVQri81a7csZRboU
 kpfs/pIzMkAAAA=
X-Change-ID: 20260214-qmi-encode-invalid-length-310dd551a186
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=DL3Sst52QBLUKYVj2tfLw4VHvR7JBJOofYsTrvCjkmk=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpmM4ZZf8ABIIkwB4cFTp9AaWBbyKtGSgR5v+To
 ayJEPcTwLuJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaZjOGRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWkHA//dov3lXOmwwVgqI6jmuyzz6EPzMhnfrRnXfKkWYc
 QyX2hcSj8xo6IC9QK3hJuXITXTmfkD7oE2dBYgaQGpETMcw9SaW1kHDGiXrm4Kw6Cld4qeV0l2n
 ZvzsOKq2TWUGZnEbq9XhBixCt+emUeK+3VxPl/H1DEAKwPz0IMVXIOpYUK30sKz6hc3N8+oG5Jo
 plqpFZxoTa/BykU/ALWSzTv/jfHcuRYAUqad2dK5Rxg6kS3TnFVPIhXpQlXqc312fFDDQLjjpl4
 UwZejmhbLFMQlbhJB3H+gz2YxFUy6QOD6WSTS9WIla0Wj8NnGaDCn50c2OyccspAINyePyrC38V
 Ab8LuoYY5rlDb1Ou82KKeRnY/ezGm/VNdGRyd3ftx2gUR7RTQ9zCVtZv5XbLpf4aZP0qEpxuC5j
 RIJFYHrSqhEhRKoX2qIpbgbVZQCGmhpjSIyGhFMt68AgZm6FZeLQpUd8evOWEzVeLuObigPLh1L
 ywCCEQ4y+lErs8Z0UodJJmsMNDJ0ojz/WqdLchjG8LEK3S8lUNPB0WTM+1b+9cDL+ux29Vf+SEF
 /pUsayy+2CNmF1sraRKBHB3qTLLcgMc1l7tcAXXrt/CMMPmd9EDf5Gh0czzu1M7QuQxx/ZXfcJA
 UTnMgdfwD5zAO248nUPNqsTrBAHLZDLS9+RMqaAyyUQQ=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: CHqfOBsOC2JusjY6chDGbUg7Hrz_58fy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDE3NSBTYWx0ZWRfXzIyeDIh7Hbqa
 SRbUH7OdGT/yVxtXuCcCBvWJM5/T/cduBmJtFyM7AqmsdL7PRtmGGI++vEu0aFFH0R9+tCXhUy8
 hIY+teAH+s63wW3HVYNmOuAPjWMgO0UdgYJmOylBYTffp+L9FuHlYCnDL5j/8VMxu7jVAVpUs2S
 QH4gv9yAFr+t8UAKes6A68CEltAlcWYo1WbNTLbNWOd/OWDs9Ipax/aTgu5ji/Yh8GHviaLM5hx
 w6L4d9vD/NTNUJ3f0RxTUutyxje1oqpfw3XI4n+vBIyReuJxYdFH2hDsafneCvkstJ4A1DJUrYq
 RYa3aq1ipIb8jR+dHlANcqKmp6gp0HeeWwsRZZdOrv2OsrZg0cBJ6Eg5zJcBbpgML6gykakLU2Z
 qLyx7bZwNIZcOVzPh0R6VzDyCYLXhHUSKgVxcIwNVwyfHdPaDI7g7EFymwjenQx3ef0igkEOwWl
 MBQbTaJpZYZrgSuLxhQ==
X-Proofpoint-ORIG-GUID: CHqfOBsOC2JusjY6chDGbUg7Hrz_58fy
X-Authority-Analysis: v=2.4 cv=KYzfcAYD c=1 sm=1 tr=0 ts=6998ce1b cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KizKeGmJ27Xn7kP_Cx8A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_03,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200175

The QMI message encoder has up until recently read a single byte (as
elem_size == 1), but with the introduction of big endian support it's
become apparent that this field is expected to be a full u32 -
regardless of the size of the length in the encoded message (which is
what elem_size specifies).

The result is that the encoder now reads past the length byte and
rejects the unreasonably large length formed when including the
following 3 bytes from the subsys_name array.

Fix this by changing to the expected type.

Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
I believe I've checked all the other users now, and this is the only
case I found that needs fixing.

Changes in v2:
- Fix the sysmon driver instead of the encoder/decoder
- Link to v1: https://lore.kernel.org/r/20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 660ac6fc408213073942f20a2c4e43a0c9b9b37e..c6cc6e519fe566a92505dc57c30e8b3e0a697179 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -203,7 +203,7 @@ static const struct qmi_elem_info ssctl_shutdown_resp_ei[] = {
 };
 
 struct ssctl_subsys_event_req {
-	u8 subsys_name_len;
+	u32 subsys_name_len;
 	char subsys_name[SSCTL_SUBSYS_NAME_LENGTH];
 	u32 event;
 	u8 evt_driven_valid;

---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260214-qmi-encode-invalid-length-310dd551a186

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

