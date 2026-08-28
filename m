Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013046.outbound.protection.outlook.com [40.93.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198947276E;
	Fri, 28 Aug 2026 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929164; cv=fail; b=Jne8wLEmd99i7BUlhf+ONKZA9WdevlZ44tA93zUxiMNxmJhw1eM7PIH6H5yuYb+d6HtFDCVPlUniYf7Vg3Etza+Cm/1Uz5mW1BZzXXYNNljT87lEEUj8RvEOypnNe7dd0gpfxicpHg1DtSNCCADgBOCDb6Fl4h+P64K2lFEaxzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929164; c=relaxed/simple;
	bh=5KcOB7zD4ZEtY5Ie3HG5jCPCWcK3R3iUSG+Pi6KbxUg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g8qR5w7ATnn2nMCW+k3c+7agtBTMFeuRBGX4aVhYRAGw7dFJJSTCopDUUGRBlxnmWrwhAnu7Ccy8cvk0QpwGY5YuAm4EC5orB3WNs1q2XrNfJhIxEta5Mfm863ehYbghVM9NJlNNiwwKsMv9zVKUjzZ4j7gIu7O/bTYsr3WVCXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1P5TVl71; arc=fail smtp.client-ip=40.93.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1P5TVl71"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJmjq42v7P7pvbBXRBGyOhd4lx9oyimqDqyGJYDzWnI5+MU9kzeCyZFvWvv6av5ZlsHKF2fBhTb+iIOIzvD2ro6f7/mXJQdM/FmioV4qA6WDt+JfwIUp0dHZq6Ojz7Fw1dYGLdyjO75mFKo7gXYuC3IhebJGu1AyjcDmlhEduo6s35IgUGchXQd0csakBh8adiJHmSq5KwCoFOiKRSvmhhYIAzINahK2x7E7PAqMYIcjJuqtQ3YGQFq8HpE/h37j0hZMeqJTK0hncCK4q/4R3BMpmRnHbJ3YLePXF2zuA5cOle0tdkUt5pcMvTgoUhfFEwmzufSJq5E2/VsqSajVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rblilD72DZ3cXUf3HoS+PQq0XtG1EfsarEf/dGqAlFU=;
 b=LibbJbBB0atB90kdqeQU1+pommdCSeIqKRN8flNPImxIz5L/zvazva0e97HCEtfV/uWwOMA/9iHoMJtCEV25IKlHu27VuaKPQtTZhQ5XId7YDBAbeDScgaYM2I2k7Xr9xeddQSZrty/PgITnAPdeo24jVHGstMXfx/ZaEStKuHHdHuoucFaaVRtB46Yyq8DoHOkjZu/6H1rNP9EUIqIOCwcDP8ydd7k0nFlc74sFT0wcKjiaqesyarYkazz1QVaDEtO59nvufe9rWCUdkzNO6yJwKE3LqplYWrzGYVWuFKratW2vP4VtOBD4bsq0JD0ekVtMW5MqXGYvtK0/j+8N8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rblilD72DZ3cXUf3HoS+PQq0XtG1EfsarEf/dGqAlFU=;
 b=1P5TVl71mjyc1cIOq7nuo+sBfB9bdlblBtfcjyegSbK9/Zdqb7CfDWfB6L/eZl/ElcXosPQKChHZTNl5sKCkzcJPDXWOhVcCMP3jO8nf7z9XuGOG1L6rsbV8/6oFGeLz6mOJynkZ7MFQxL57+ouJuqJzKbcVjJdchXzPpxJUcn8=
Received: from BN9P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::19)
 by CYYPR12MB8854.namprd12.prod.outlook.com (2603:10b6:930:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:59:15 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::53) by BN9P221CA0014.outlook.office365.com
 (2603:10b6:408:10a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Fri, 28
 Aug 2026 14:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:59:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:59:12 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:59:11 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v8 0/5] Enhance RPMsg buffer management
Date: Fri, 28 Aug 2026 07:58:47 -0700
Message-ID: <20260828145853.2843486-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CYYPR12MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f9b26b-d106-45aa-bef1-08df0514ed5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	CPGHK/+TQnhKzYzlWZWagS9YnYmlf5C9gSkRQE1bAzMFHJdR4uoQ0DhIhleN5m4aDYTUEM1BaqjOlVR0TObeyST2ED1C3n2hdubAsQQ13ASi/semF30kIjjJAZp2bbHdSFEfLCPSK3YEmCf8Y3f6RG4PHjvFzphoGQPVlXhMhj615Bvtih/6rAL2uZRk0hDb8X3L4fqKlL58MUkVB2MNwGdSBWQ+NYJ7YgA4dX4YoV4/Wlb/oSlC0+DBzO9g+0IA2tGXMh9nWmy7F+LkBxTH6lKlYHAntuaqGkTBbs8L1ASsaKImvyCCHIZdcNlT2kNQuNe+npCArGyQTMzmCk/FzDdJ8n+t4qEP3Yh2UqjPRWqu8Q1wq4yaWoQ0SFvMD8VXe7MfxY/1Im4rg8XYhHjmvYqbTvk1ZH7WlE3Tr5SS90Sw2RNokC4qz2+NEeNYfdxtPFZ2eQ7As5bs7leWhoiNMnf7ot6VrM6ooxypSvZy6HT+4tu7uRQeKq9wRDCd2mBkqhvvoeo/7olfC/avTHrDYn3NEtOlTkY/eyX0Mq3rY/kUaQl9+Hd4z7kt2xf49iRAq1GRW1VBTgO6r4gPwbqa9fRtQc9QeJ/r9p0aipZ2e40514vtsmU/4Yy9BhgbKVHbNAb0QoqFfyf0xyUii6LBXmL5dMoXZqqrbXtpPULU9y8RQzDQ5Z1GVV76Jt0Zr8/HOJuskPg8xZkwzYZkdBVNIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XNahDNToCG+xxhIa0k7pOyW6KMMKDAjeyM8OyMnML4BvYLUXuINkL7rWQYzZqlbkItDVQyNOUdO4mQFWVsAf6Sq3bddXgnWc2qgrJrJBEbTPyS/35uyxAmCUPq1d4TJbRe7M27nkyti0LQ479sa9QKXmGxUz8GMBW4Z+qJh5q/WyqGjMKfpomCvexvdL6XMOxENNiEwaJxW0Y8OKncjqTRRKjCkd5+36plULXOnQn9Q2q/jz9GNjGxNk+oFwH34b1zG2+a9QuI+F1uw/FK0TblOH8UYelX1gfUtWE/g8eSVRR5UgyMJKCkxoLzXzXVXGuyTJPD/iakZIlcUHY/7WSFW2W5FPgD00lqXVjUrsvYZrUZGMia+n4T72qfnnnhl8roMcFJpHlIh8f7K/DAZ/nmVNmKkCrN+JdAv+lO4y1pHm0v9fAxjjXORz8sRMKoPh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:59:14.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f9b26b-d106-45aa-bef1-08df0514ed5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8854

Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
tx directions. This design is not suitable if the payload is larger than
512 bytes or the payload is very small and doesn't need that much
memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
size and rx buf size from the virtio config space in the resource table.

Changes in v8:
  - fix commit message of 3/5, "%s/enable/Enabled"
  - introduce new function to get buffer size for the vdev device
  - fix description of VIRTIO_RPMSG_F_BUFSZ define
  - "%s/or differnt RX and TX sizes)/or different RX and TX queue sizes)/"

Changes in v7:
  - Fix 5/5 commit text, and move change log out of commit text

Changes in v6:
  - remove buffer alignment from config space
  - rpmsg.rst: modify alignment related documentation

Changes in v5:
  - fix documentation about alignment of the buffer size
  - change version field from u16 to u8
  - remove buffer alignment check
  - Separate buffer alignment vs MTU of a single buffer
  - Use buffer alignment only to get next buffer address at alignment
    boundary

Changes in v4:
  - Introduce new patch to modify rpmsg.rst documentation
  - check version is always 1.
  - check size field is same as size of struct virtio_rpmsg_config
  - introduce alignment field
  - check alignment field is power of 2
  - check tx and rx buf size is aligned with alignment passed in the
    structure
  - check msg size is < MTU size

Changes in v3:
  - new patch [1/4] that renames variables with clear names.
  - %s/rbufs/rx_bufs/
  - %s/sbufs/tx_bufs/
  - %s/last_sbuf/last_tx_buf/
  - add num_rx_buf and num_tx_buf in the documentation
  - change version field from u16 to u8
  - introduce size field in the rpmsg_virtio_config structure
  - check version field is set to any non-zero value.
  - check size field is not 0.
  - Remove field for private config, as not needed for now.
  - add documentation of rpmsg_virtio_config structure
  - Check for error when retrieving MTU size in the sample driver
  - %s/mtu/MTU/

Changes in v2:
  - Change author
  - fix commit message with better explanation
  - %s/sbuf/tx_buf
  - %s/rbuf/rx_buf
  - %s/num_rbuf/num_rx_buf/
  - %s/num_sbuf/num_tx_buf/
  - %s/sbuf_size/tx_buf_size/
  - %s/rbuf_size/rx_buf_size/
  - fix typo
  - do not use ALIGN on buf size, rely on allocator
  - make err msg more explicit, %s/vdev config:/bad vdev config/
  - fix license and add AMD copyrights in the header virtio_rpmsg.h
  - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
  - use __virtio32 over __u32
  - add version field to virtio rpmsg config structure
  - Introduce new patch to print rpmsg mtu size in the sample rpmsg driver
  - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h


Tanmay Shah (5):
  rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
  rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
  rpmsg: virtio_rpmsg_bus: get buffer size from config space
  docs: rpmsg: add virtio config space details
  samples: rpmsg: add MTU size info

 Documentation/staging/rpmsg.rst     |  17 +++
 drivers/rpmsg/virtio_rpmsg_bus.c    | 156 +++++++++++++++++++---------
 include/linux/rpmsg/virtio_rpmsg.h  |  41 ++++++++
 samples/rpmsg/rpmsg_client_sample.c |  20 +++-
 4 files changed, 186 insertions(+), 48 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h


base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
-- 
2.43.0

