Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3986BC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Dec 2020 10:58:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F09B82222A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Dec 2020 10:58:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgLWK6A (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Dec 2020 05:58:00 -0500
Received: from aposti.net ([89.234.176.197]:45690 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728157AbgLWK6A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Dec 2020 05:58:00 -0500
Date:   Wed, 23 Dec 2020 10:57:09 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Doc to write firmware?
To:     linux-remoteproc@vger.kernel.org
Message-Id: <93HSLQ.5D3DAYSGVCVP@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

Having written the ingenic-remoteproc driver I am trying now to write 
something a bit more advanced than a hello-world. Something like a 
case-invert program for starters. However I'm having a hard time trying 
to figure out how things work.

My resource table is as follows:

----------------------------
struct resource_table_hdr {
 struct resource_table header;

 uint32_t offset[3];

 struct {
  struct fw_rsc_hdr header;
  struct fw_rsc_carveout carveout;
 } carveout;

 struct {
  struct fw_rsc_hdr header;
  struct fw_rsc_trace trace;
 } trace;

 struct {
  struct fw_rsc_hdr header;
  struct fw_rsc_vdev vdev;
  struct fw_rsc_vdev_vring vrings[2];
  uint8_t config[0xc];
 } vdev;
};

const struct resource_table_hdr resource_table
__attribute__((used, section (".resource_table"))) = {
 .header = {
  .ver = 1,
  .num = ARRAY_SIZE(resource_table.offset), /* Number of resources */
 },

 .offset[0] = offsetof(struct resource_table_hdr, carveout),
 .offset[1] = offsetof(struct resource_table_hdr, trace),
 .offset[2] = offsetof(struct resource_table_hdr, vdev),

 .carveout = {
  .header = {
   .type = RSC_CARVEOUT,
  },
  .carveout = {
   .da = 0xf4000000,
   .len = 0x2000,
   .name = "firmware",
  },
 },

 /* Trace resource to printf() into */
 .trace = {
  .header = {
   .type = RSC_TRACE,
  },
  .trace = {
   .da = (uint32_t)trace_buf,
   .len = TRACE_BUFFER_SIZE,
   .name = "trace",
  },
 },

 /* VirtIO device */
 .vdev = {
  .header = {
   .type = RSC_VDEV,
  },
  .vdev = {
   .id = VIRTIO_ID_RPROC_SERIAL,
   .notifyid = 0,
   .dfeatures = 0,
   .config_len = 0xc,
   .num_of_vrings = 2,
  },
  .vrings = {
   [0] = {
    .align = 0x10,
    .num = 0x4,
    .notifyid = 0,
   },
   [1] = {
    .align = 0x10,
    .num = 0x4,
    .notifyid = 0,
   },
  },
 },
};
----------------------------

The firmware is properly loaded and I get debug prints in my trace 
buffer. However, my vrings' .da fields don't seem to be initialized to 
anything meaningful at all. Then I use the virtio/vring code from 
(https://github.com/MIPS/mips-rproc-example/blob/master/firmware/common/include/vring.h), 
and calling vring_print() shows that my vring_desc's addresses are 
garbage as well.

Is there an example on how to write a basic I/O remoteproc program?

Cheers,
-Paul


