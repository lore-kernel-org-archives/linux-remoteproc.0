Return-Path: <sunnyliangjy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180817150948.GA20845@rob-hp-laptop>
References: <1534403190-28523-1-git-send-email-jliang@xilinx.com>
 <1534403190-28523-8-git-send-email-jliang@xilinx.com> <20180817150948.GA20845@rob-hp-laptop>
From: Wendy Liang <sunnyliangjy@gmail.com>
Date: Sun, 19 Aug 2018 22:54:55 -0700
Message-ID: <CAA07jV9FqeFM4Y8SaPdAaYPskNcx0Ct6ywfdX459pzsub15xCw@mail.gmail.com>
Subject: Re: [PATCH 7/7] Documentation: devicetree: Add Xilinx R5 rproc binding
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh@kernel.org>
Cc: Wendy Liang <wendy.liang@xilinx.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, rajan.vaja@xilinx.com, jollys@xilinx.com, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Aug 17, 2018 at 8:09 AM, Rob Herring <robh@kernel.org> wrote:
> Hi, this email is from Rob's (experimental) review bot. I found a couple
> of common problems with your patch. Please see below.
>
> On Thu, 16 Aug 2018 00:06:30 -0700, Wendy Liang wrote:
>> Add device tree binding for Xilinx Cortex-r5 remoteproc.
>>
>> Signed-off-by: Wendy Liang <jliang@xilinx.com>
>
> The preferred subject prefix is "dt-bindings: <binding dir>: ...".
Will updated in the next release
>
>> ---
>>  .../remoteproc/xlnx,zynqmp-r5-remoteproc.txt       | 81 ++++++++++++++++++++++
>>  1 file changed, 81 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5-remoteproc.txt
>>
