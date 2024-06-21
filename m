Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27317C229
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jun 2024 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719007429; cv=none; b=e7kQNB07kaMsi302WAqr6HhVM8ULDPKTVKuUHrHmHvqV1U8XJ0xSD3cbp7fyrscD/Qdm7dU3Et/a9/aah1JGqi9s9qqpcOT5oByFq060T9o75glEX8CEjLXCMU+srJ2Ryg4EQQMaAtVBQ64NDfW55fsw/xelDl+yipmGjg6bibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719007429; c=relaxed/simple;
	bh=ODPNUfqlgTPNip8NzO3yFFS0TyDOl9bfqyvhX/ZksJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UaCWI1j4DLVr0W/OYooO0OhxA2YigYd4VG6oOlNj3CjGJLcMP6HDoA58QxJuApFDBIH7El41357Li5HxuSgArBNVO6FNJmKFB0wzKZ1QsxY4WUPpXiC4BSMDgWggh9vjYhF5YckKQtDAtgY0gGzerVBqu3FQi2NbM4YNPTwU9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2/zcu5P; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2/zcu5P"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso594578e87.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jun 2024 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719007424; x=1719612224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sp0SWsMme46zLJDGC4c3PkTtj5NHRx7g4PD6NiVY7aQ=;
        b=V2/zcu5PxI9uzDDorqmFR028WSQA0XDyRh5R8EnsoHrm/roiJmjOL5SZHPosqqZGtS
         nvlkKNFscDVC9yyDCFa3DDOegW8ZD7oZtqWMo48C/5DA+1ibIsnkBVN8Qt1iMEsdkyR2
         GRSDhICO5clBhx/eCb+QUzVdf+4q9OlgOmQHZs1gSc3tz+nqr715S+i8SDIyryP/DSp1
         hekNIt32u/iem0nLYmau6PmLLVDQoj5uc09IcfmIykviUy9hYpkqSpua/WG9cpM6mXGY
         DU0Ld8CGuIN15GV0NtaBzmBCu6gBuooKvAyxk84Sh4bBRa1d3YFWNQ39S/DKAQPY/a6X
         lvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007424; x=1719612224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sp0SWsMme46zLJDGC4c3PkTtj5NHRx7g4PD6NiVY7aQ=;
        b=M4yGMLRStFxFMGtsTQF0ZT1ukTSRvCwgdGg0/0qGk20wzQKkny2pVQ+2j+ToCee/HF
         Pdsix2yfoykAaTa9nMHSZCFXlZQmDsdrrVKjSLgGeVs2CIHv/LGzPSc029gfz0JNxUGA
         1OpVDGyyZjo+4fK6AiLhV1Zdwd6RnsRjsu/D19tNAIFc/wH8FO67xVdzf/CezdxmWTCK
         YahydX/+DmBpzZyC71M6vuktLyLH1tXn+bB3il1MCLBSb0DLtHyYAYBspF7p2mJJSpXD
         txN4uXKJsrST523/18D8d6pQiGbVSpn9xQrd3CoIcgEvFb9Nba3h4VjxUpLbce9Xe23I
         5N0g==
X-Forwarded-Encrypted: i=1; AJvYcCV24mtA7cjBNln5oGajT3xc+cnF5IgNhimE7uILCNlBT3bcYXF3SbDhl0+rCmVDU7z94OlsskHnOow7Bxd1PfxcER0ZgYbuZWObjyKhNOPkzA==
X-Gm-Message-State: AOJu0Yz00bKhVy8mgD+q/8wAGr/KhWlRKbQQcPaz3eDwjcHOgG/QGCyQ
	mV6A0PNQpiQwfdDoujQPhi6GeM3dxOEjJbOKampv1UIJBGBWPsZVvj5RHjLSF5M=
X-Google-Smtp-Source: AGHT+IGHKYrOeTP+T/1GPDPoTx/zl29x88SZHA1fwdxBzzhzSprXNK727FlGeEB57gs6y1yF4h9sLg==
X-Received: by 2002:a05:6512:b20:b0:52c:adc3:ea9f with SMTP id 2adb3069b0e04-52ccaa09f65mr7732687e87.0.1719007423606;
        Fri, 21 Jun 2024 15:03:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6431fcdsm318293e87.210.2024.06.21.15.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:03:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 22 Jun 2024 01:03:42 +0300
Subject: [PATCH v9 3/5] soc: qcom: pdr: extract PDR message marshalling
 data
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240622-qcom-pd-mapper-v9-3-a84ee3591c8e@linaro.org>
References: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
In-Reply-To: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22020;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ODPNUfqlgTPNip8NzO3yFFS0TyDOl9bfqyvhX/ZksJ0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1rpjz18T7/HHVs+5c2N5R7Cm/rFv7DfaPrttViua2frt
 azLsWnlnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYSLgAB8OMnPvnMow7b0om
 XfV+1Kjcuv/2R6MkoUszcpO/HOypubSrM+hB15JM3fS1+ZKb9uurhW7dsbqp8eOzww5X6ysPzPR
 VdNL7VPDZdp7ipQsFGT975LxqHNSiNv1hl5cxYTi7SfhUXvBX7jvKt5Qe8KoJNUcWrSqzrFR0eG
 3yM/j003sairz3NQoulV86HK1+/dX0yaUSvoL/+OM11x93T21+79ZQVeTKsS2u7Hi6BsuklI+iX
 vaOf3y/Nm52szmU0Rm+NqTfem1YcZgQR/iyo2tT6rbunaXXzzXH6a1l2ZvsujplneQEtb9VxvVh
 vIfSP51MO1Qtv/jxy40fjy+4uyw4dJNgnMT96eFndV0KAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The in-kernel PD mapper is going to use same message structures as the
QCOM_PDR_HELPERS module. Extract message marshalling data to separate
module that can be used by both PDR helpers and by PD mapper.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig        |   4 +
 drivers/soc/qcom/Makefile       |   1 +
 drivers/soc/qcom/pdr_internal.h | 306 ++------------------------------------
 drivers/soc/qcom/qcom_pdr_msg.c | 319 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 334 insertions(+), 296 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 5af33b0e3470..95973c6b828f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -75,8 +75,12 @@ config QCOM_OCMEM
 config QCOM_PDR_HELPERS
 	tristate
 	select QCOM_QMI_HELPERS
+	select QCOM_PDR_MSG
 	depends on NET
 
+config QCOM_PDR_MSG
+	tristate
+
 config QCOM_PMIC_PDCHARGER_ULOG
 	tristate "Qualcomm PMIC PDCharger ULOG driver"
 	depends on RPMSG
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ca0bece0dfff..3110ac3288bc 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
 obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
+obj-$(CONFIG_QCOM_PDR_MSG)	+= qcom_pdr_msg.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 03c282b7f17e..7e5bb5a95275 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -28,83 +28,12 @@ struct servreg_location_entry {
 	u32 instance;
 };
 
-static const struct qmi_elem_info servreg_location_entry_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   name),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   instance),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   service_data_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   service_data),
-	},
-	{}
-};
-
 struct servreg_get_domain_list_req {
 	char service_name[SERVREG_NAME_LENGTH + 1];
 	u8 domain_offset_valid;
 	u32 domain_offset;
 };
 
-static const struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_get_domain_list_req,
-					   service_name),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_req,
-					   domain_offset_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_req,
-					   domain_offset),
-	},
-	{}
-};
-
 struct servreg_get_domain_list_resp {
 	struct qmi_response_type_v01 resp;
 	u8 total_domains_valid;
@@ -116,264 +45,49 @@ struct servreg_get_domain_list_resp {
 	struct servreg_location_entry domain_list[SERVREG_DOMAIN_LIST_LENGTH];
 };
 
-static const struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   total_domains_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   total_domains),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   db_rev_count_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   db_rev_count),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   domain_list_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   domain_list_len),
-	},
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = SERVREG_DOMAIN_LIST_LENGTH,
-		.elem_size      = sizeof(struct servreg_location_entry),
-		.array_type	= VAR_LEN_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   domain_list),
-		.ei_array      = servreg_location_entry_ei,
-	},
-	{}
-};
-
 struct servreg_register_listener_req {
 	u8 enable;
 	char service_path[SERVREG_NAME_LENGTH + 1];
 };
 
-static const struct qmi_elem_info servreg_register_listener_req_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_register_listener_req,
-					   enable),
-	},
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_register_listener_req,
-					   service_path),
-	},
-	{}
-};
-
 struct servreg_register_listener_resp {
 	struct qmi_response_type_v01 resp;
 	u8 curr_state_valid;
 	enum servreg_service_state curr_state;
 };
 
-static const struct qmi_elem_info servreg_register_listener_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_register_listener_resp,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_register_listener_resp,
-					   curr_state_valid),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum servreg_service_state),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_register_listener_resp,
-					   curr_state),
-	},
-	{}
-};
-
 struct servreg_restart_pd_req {
 	char service_path[SERVREG_NAME_LENGTH + 1];
 };
 
-static const struct qmi_elem_info servreg_restart_pd_req_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_restart_pd_req,
-					   service_path),
-	},
-	{}
-};
-
 struct servreg_restart_pd_resp {
 	struct qmi_response_type_v01 resp;
 };
 
-static const struct qmi_elem_info servreg_restart_pd_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_restart_pd_resp,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
 struct servreg_state_updated_ind {
 	enum servreg_service_state curr_state;
 	char service_path[SERVREG_NAME_LENGTH + 1];
 	u16 transaction_id;
 };
 
-static const struct qmi_elem_info servreg_state_updated_ind_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_state_updated_ind,
-					   curr_state),
-	},
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_state_updated_ind,
-					   service_path),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct servreg_state_updated_ind,
-					   transaction_id),
-	},
-	{}
-};
-
 struct servreg_set_ack_req {
 	char service_path[SERVREG_NAME_LENGTH + 1];
 	u16 transaction_id;
 };
 
-static const struct qmi_elem_info servreg_set_ack_req_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_set_ack_req,
-					   service_path),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_set_ack_req,
-					   transaction_id),
-	},
-	{}
-};
-
 struct servreg_set_ack_resp {
 	struct qmi_response_type_v01 resp;
 };
 
-static const struct qmi_elem_info servreg_set_ack_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_set_ack_resp,
-					   resp),
-		.ei_array       = qmi_response_type_v01_ei,
-	},
-	{}
-};
+extern const struct qmi_elem_info servreg_location_entry_ei[];
+extern const struct qmi_elem_info servreg_get_domain_list_req_ei[];
+extern const struct qmi_elem_info servreg_get_domain_list_resp_ei[];
+extern const struct qmi_elem_info servreg_register_listener_req_ei[];
+extern const struct qmi_elem_info servreg_register_listener_resp_ei[];
+extern const struct qmi_elem_info servreg_restart_pd_req_ei[];
+extern const struct qmi_elem_info servreg_restart_pd_resp_ei[];
+extern const struct qmi_elem_info servreg_state_updated_ind_ei[];
+extern const struct qmi_elem_info servreg_set_ack_req_ei[];
+extern const struct qmi_elem_info servreg_set_ack_resp_ei[];
 
 #endif
diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
new file mode 100644
index 000000000000..9b46f42aa146
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pdr_msg.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/soc/qcom/qmi.h>
+
+#include "pdr_internal.h"
+
+const struct qmi_elem_info servreg_location_entry_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   name),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   instance),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   service_data_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   service_data),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_location_entry_ei);
+
+const struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   service_name),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   domain_offset_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   domain_offset),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_get_domain_list_req_ei);
+
+const struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   total_domains_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   total_domains),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   db_rev_count_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   db_rev_count),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list_valid),
+	},
+	{
+		.data_type      = QMI_DATA_LEN,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list_len),
+	},
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = SERVREG_DOMAIN_LIST_LENGTH,
+		.elem_size      = sizeof(struct servreg_location_entry),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list),
+		.ei_array      = servreg_location_entry_ei,
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_get_domain_list_resp_ei);
+
+const struct qmi_elem_info servreg_register_listener_req_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_register_listener_req,
+					   enable),
+	},
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_register_listener_req,
+					   service_path),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_register_listener_req_ei);
+
+const struct qmi_elem_info servreg_register_listener_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   curr_state_valid),
+	},
+	{
+		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof(enum servreg_service_state),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   curr_state),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_register_listener_resp_ei);
+
+const struct qmi_elem_info servreg_restart_pd_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_restart_pd_req,
+					   service_path),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_restart_pd_req_ei);
+
+const struct qmi_elem_info servreg_restart_pd_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_restart_pd_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_restart_pd_resp_ei);
+
+const struct qmi_elem_info servreg_state_updated_ind_ei[] = {
+	{
+		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   curr_state),
+	},
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   service_path),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x03,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   transaction_id),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_state_updated_ind_ei);
+
+const struct qmi_elem_info servreg_set_ack_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_set_ack_req,
+					   service_path),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_set_ack_req,
+					   transaction_id),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_set_ack_req_ei);
+
+const struct qmi_elem_info servreg_set_ack_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_set_ack_resp,
+					   resp),
+		.ei_array       = qmi_response_type_v01_ei,
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_set_ack_resp_ei);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Protection Domain messages data");

-- 
2.39.2

